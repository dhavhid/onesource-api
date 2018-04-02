<?php

/**
 * Created by PhpStorm.
 * User: david
 * Description: This script is used to distribute incoming tasks/jobs to a number of technicians based on their available time.
 * The technicians work 8 hours a day(480 minutes) and each task can be completed in a number of minutes.
 * The idea is to distribute those tasks among the technicians equitably by calculating the available time remaining after
 * the last time a task was assigned to them. The current task/job is assigned to the technician with more time available in order
 * to fill his time of work and that process is repeated each time that a new task/job is received.
 *
 * Database table "technicians":
 * +-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| name  | varchar(100) | NO   |     | NULL    |                |
| email | varchar(100) | YES  |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
 *
 * Database table "jobs":
 * +-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | NO   |     | NULL    |                |
| description | varchar(250) | YES  |     | NULL    |                |
| jobTime     | time         | NO   |     | NULL    |                |
| jobDate     | date         | YES  |     | NULL    |                |
| tech_id     | int(11)      | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
 */
date_default_timezone_set('America/New_York');

/**
 * Class QueueJobs
 */
class QueueJobs
{
    /**
     * @var PDO
     */
    protected $dbConnection;
    /**
     * @var string
     */
    protected $dbLastError;
    /**
     * @var bool
     */
    protected $dbError = false;
    /**
     * @var bool
     */
    protected $dbConnected = false;
    /**
     * @var int
     */
    protected $dbFetchMode = PDO::FETCH_ASSOC;
    /**
     * @var bool|string
     */
    protected $today;
    /**
     * @var int
     */
    protected $availableTime = 480;

    /**
     *
     */
    public function __construct()
    {
        $this->today = date('Y-m-d');
        try {
            $this->dbConnection = new PDO('mysql:host=localhost;dbname=jobs','root','elmismo');
            // set the option to handle errors.
            $this->dbConnection->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
            $this->dbConnected = true;
            $this->dbConnection->exec("DELETE FROM jobs;");
        } catch (PDOException $e){
            $this->dbLastError = $e->getMessage();
            $this->dbError = true;
        }
    }

    /**
     * @param $statement
     * @param bool|false $write
     * @param array $params
     * @return array|bool|int
     */
    public function executeQuery($statement, $write = false, $params = [])
    {
        // check our connection first
        if ($this->dbConnected) {
            try {
                $stmt = $this->dbConnection->prepare($statement);
                $stmt->execute($params);
                $this->dbError = false;
                if (!$write) {
                    return $stmt->fetchAll($this->dbFetchMode);
                } else {
                    return $stmt->rowCount();
                }
            } catch (PDOException $e) {
                $this->dbLastError = $e->getMessage();
                $this->dbError = true;
            }
        } else {
            $this->dbError = true;
            $this->dbLastError = 'Could not stablish a connection to the database.';
        }
        return false;
    }

    /**
     * @param $data
     * @return array
     */
    public function queueJob($data)
    {
        /* We need to decide who of the techs will be in charge of the job based on their available time.
         * the one with more available time will be picked to take the job.
         */
        $availableTime = $this->availableTime;
        $today = $this->today;
        $getTech_stmt = "SELECT id, ({$availableTime} - (IFNULL((SELECT SUM((EXTRACT(HOUR FROM jobTime)*60) + EXTRACT(MINUTE FROM jobTime))
                        FROM jobs WHERE jobDate = '{$today}' AND tech_id = technicians.id GROUP BY tech_id LIMIT 1),0))) as availableTime
                        FROM technicians ORDER BY availableTime DESC LIMIT 1;";
        $getTech = $this->executeQuery($getTech_stmt);

        if (count($getTech) > 0) {
            $tech = array_pop($getTech);
            // now check if the time available is greater than the duration of the job. In such case we cannot queue the job.
            if ($tech['availableTime'] < $data['jobTime']) {
                return ['message'=>'There are no technicians available to complete this job.','success'=>false];
            } else {

                // assign the job to the selected technitian.
                $data['jobDate'] = $this->today;
                $data['jobTime'] = $this->turnToTime($data['jobTime']);
                $data['tech_id'] = $tech['id'];
                $queueJob_stmt = "INSERT INTO jobs(title,description,jobTime,jobDate,tech_id) VALUES(:title,:description,:jobTime,:jobDate,:tech_id);";
                $this->executeQuery($queueJob_stmt,true,$data);
                if ($this->dbError === false) {
                    return ['message'=>'The job was assigned successfuly.','success'=>true];
                } else {
                    return ['message'=>'There was an error while assigning the job. ' . $this->dbLastError,'success'=>false];
                }
            }
        }
        return ['message'=>$this->dbLastError,'success'=>false];
    }

    /**
     * @param $number_of_minutes
     * @return string
     */
    public function turnToTime($number_of_minutes)
    {
        $hours = floor($number_of_minutes/60);
        $minutes = $number_of_minutes%60;

        return sprintf('%02d',$hours) . ':' . sprintf('%02d',$minutes) . ':00';
    }

    /**
     * @param null $date
     * @return array|bool|int
     */
    public function getJobsByTech($date = null)
    {
        if (empty($date)) {
            $date = $this->today;
        }
        $availableTime = $this->availableTime;

        // get the list of technicians to group queued jobs.
        $techs_stmt = "SELECT id,name, ({$availableTime} - (IFNULL((SELECT SUM((EXTRACT(HOUR FROM jobTime)*60) + EXTRACT(MINUTE FROM jobTime))
                        FROM jobs WHERE jobDate = '{$date}' AND tech_id = technicians.id GROUP BY tech_id LIMIT 1),0))) as availableTime, (IFNULL((SELECT SUM((EXTRACT(HOUR FROM jobTime)*60) + EXTRACT(MINUTE FROM jobTime))
                        FROM jobs WHERE jobDate = '{$date}' AND tech_id = technicians.id GROUP BY tech_id LIMIT 1),0)) as busyTime
                        FROM technicians ORDER BY busyTime DESC;";
        $techs = $this->executeQuery($techs_stmt);

        // get the jobs.
        $jobs_stmt = "SELECT jobs.id,title,description,(EXTRACT(HOUR FROM jobTime)*60 + EXTRACT(MINUTE FROM jobTime)) AS jobTime,jobDate,tech_id FROM jobs JOIN technicians ON jobs.tech_id = technicians.id WHERE jobDate = '{$date}' ORDER BY name ASC;";
        $jobs = $this->executeQuery($jobs_stmt);
        if ($this->dbError === true) {
            return ['message'=>'There was an error while fetching the jobs from database. ' . $this->dbLastError,'success'=>false];
        }
        // now group jobs by technicians. Instead of making a lot of subqueries which would slow down the process.
        $n_techs = count($techs);
        foreach ($jobs as $job) {
            for ($i=0;$i<$n_techs;$i++) {
                if ($job['tech_id'] == $techs[$i]['id']) {
                    if(!isset($techs[$i]['jobs'])) {
                        $techs[$i]['jobs'] = [];
                    }
                    $techs[$i]['jobs'][] = $job;
                }
            }
        }
        return $techs;
    }
}

#      ______                                __                ____   __  __
#     / ____/_  __ ____ _ ____ ___   ____   / /___     ____   / __/  / / / /_____ ____ _ ____ _ ___
#    / __/  | |/_// __ `// __ `__ \ / __ \ / // _ \   / __ \ / /_   / / / // ___// __ `// __ `// _ \
#   / /___ _>  < / /_/ // / / / / // /_/ // //  __/  / /_/ // __/  / /_/ /(__  )/ /_/ // /_/ //  __/
#  /_____//_/|_| \__,_//_/ /_/ /_// .___//_/ \___/   \____//_/     \____//____/ \__,_/ \__, / \___/
#                                /_/                                                  /____/

$jobs = [
    ["title"=> "Cras pellentesque. Sed","description"=> "in consequat enim diam vel arcu. Curabitur","jobTime"=> 19,"jobDate"=> "2015-10-01"],
	["title"=> "lorem eu metus.","description"=> "gravida. Aliquam tincidunt, nunc ac mattis ornare,","jobTime"=> 48,"jobDate"=> "2015-10-01"],
	["title"=> "porttitor interdum. Sed","description"=> "pede. Cras vulputate velit eu sem. Pellentesque","jobTime"=> 51,"jobDate"=> "2015-10-01"],
	["title"=> "est mauris, rhoncus","description"=> "Sed congue, elit sed consequat auctor, nunc","jobTime"=> 51,"jobDate"=> "2015-10-01"],
	["title"=> "adipiscing elit. Aliquam","description"=> "egestas a, scelerisque sed, sapien. Nunc pulvinar","jobTime"=> 60,"jobDate"=> "2015-10-01"],
	["title"=> "Morbi accumsan laoreet","description"=> "Nullam scelerisque neque sed sem egestas blandit.","jobTime"=> 11,"jobDate"=> "2015-10-01"],
	["title"=> "sed, facilisis vitae,","description"=> "Quisque tincidunt pede ac urna. Ut tincidunt","jobTime"=> 4,"jobDate"=> "2015-10-01"],
	["title"=> "dolor egestas rhoncus.","description"=> "Phasellus dolor elit, pellentesque a, facilisis non,","jobTime"=> 14,"jobDate"=> "2015-10-01"],
	["title"=> "cursus in, hendrerit","description"=> "vestibulum massa rutrum magna. Cras convallis convallis","jobTime"=> 26,"jobDate"=> "2015-10-01"],
	["title"=> "inceptos hymenaeos. Mauris","description"=> "dignissim lacus. Aliquam rutrum lorem ac risus.","jobTime"=> 71,"jobDate"=> "2015-10-01"],
	["title"=> "magna nec quam.","description"=> "arcu. Sed eu nibh vulputate mauris sagittis","jobTime"=> 35,"jobDate"=> "2015-10-01"],
	["title"=> "eu, ultrices sit","description"=> "fringilla purus mauris a nunc. In at","jobTime"=> 27,"jobDate"=> "2015-10-01"],
	["title"=> "sed pede nec","description"=> "viverra. Donec tempus, lorem fringilla ornare placerat,","jobTime"=> 24,"jobDate"=> "2015-10-01"]
];

$queuejobs = new QueueJobs();

foreach ($jobs as $job) {
    $result = $queuejobs->queueJob($job);
    if ($result['success'] === false) {
        die($result['message']);
    }
}

header('application/json');
echo json_encode($queuejobs->getJobsByTech());

// Demo of returned json object

/*
 * [
  {
    "id": "3",
    "name": "Victor",
    "availableTime": "361",
    "busyTime": "119",
    "jobs": [
      {
        "id": "350",
        "title": "inceptos hymenaeos. Mauris",
        "description": "dignissim lacus. Aliquam rutrum lorem ac risus.",
        "jobTime": "71",
        "jobDate": "2015-10-01",
        "tech_id": "3"
      },
      {
        "id": "342",
        "title": "lorem eu metus.",
        "description": "gravida. Aliquam tincidunt, nunc ac mattis ornare,",
        "jobTime": "48",
        "jobDate": "2015-10-01",
        "tech_id": "3"
      }
    ]
  },
  {
    "id": "4",
    "name": "Francisco",
    "availableTime": "394",
    "busyTime": "86",
    "jobs": [
      {
        "id": "351",
        "title": "magna nec quam.",
        "description": "arcu. Sed eu nibh vulputate mauris sagittis",
        "jobTime": "35",
        "jobDate": "2015-10-01",
        "tech_id": "4"
      },
      {
        "id": "343",
        "title": "porttitor interdum. Sed",
        "description": "pede. Cras vulputate velit eu sem. Pellentesque",
        "jobTime": "51",
        "jobDate": "2015-10-01",
        "tech_id": "4"
      }
    ]
  },
  {
    "id": "1",
    "name": "Luis",
    "availableTime": "396",
    "busyTime": "84",
    "jobs": [
      {
        "id": "345",
        "title": "adipiscing elit. Aliquam",
        "description": "egestas a, scelerisque sed, sapien. Nunc pulvinar",
        "jobTime": "60",
        "jobDate": "2015-10-01",
        "tech_id": "1"
      },
      {
        "id": "353",
        "title": "sed pede nec",
        "description": "viverra. Donec tempus, lorem fringilla ornare placerat,",
        "jobTime": "24",
        "jobDate": "2015-10-01",
        "tech_id": "1"
      }
    ]
  },
  {
    "id": "5",
    "name": "David",
    "availableTime": "402",
    "busyTime": "78",
    "jobs": [
      {
        "id": "352",
        "title": "eu, ultrices sit",
        "description": "fringilla purus mauris a nunc. In at",
        "jobTime": "27",
        "jobDate": "2015-10-01",
        "tech_id": "5"
      },
      {
        "id": "344",
        "title": "est mauris, rhoncus",
        "description": "Sed congue, elit sed consequat auctor, nunc",
        "jobTime": "51",
        "jobDate": "2015-10-01",
        "tech_id": "5"
      }
    ]
  },
  {
    "id": "2",
    "name": "Jorge",
    "availableTime": "406",
    "busyTime": "74",
    "jobs": [
      {
        "id": "349",
        "title": "cursus in, hendrerit",
        "description": "vestibulum massa rutrum magna. Cras convallis convallis",
        "jobTime": "26",
        "jobDate": "2015-10-01",
        "tech_id": "2"
      },
      {
        "id": "348",
        "title": "dolor egestas rhoncus.",
        "description": "Phasellus dolor elit, pellentesque a, facilisis non,",
        "jobTime": "14",
        "jobDate": "2015-10-01",
        "tech_id": "2"
      },
      {
        "id": "347",
        "title": "sed, facilisis vitae,",
        "description": "Quisque tincidunt pede ac urna. Ut tincidunt",
        "jobTime": "4",
        "jobDate": "2015-10-01",
        "tech_id": "2"
      },
      {
        "id": "346",
        "title": "Morbi accumsan laoreet",
        "description": "Nullam scelerisque neque sed sem egestas blandit.",
        "jobTime": "11",
        "jobDate": "2015-10-01",
        "tech_id": "2"
      },
      {
        "id": "341",
        "title": "Cras pellentesque. Sed",
        "description": "in consequat enim diam vel arcu. Curabitur",
        "jobTime": "19",
        "jobDate": "2015-10-01",
        "tech_id": "2"
      }
    ]
  }
]
 * */