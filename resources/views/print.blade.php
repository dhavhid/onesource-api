<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        body{margin: 10px 10px;}
        h2 {page-break-before: always;}
    </style>
    <link rel="stylesheet" href="<?php echo asset('css/bootstrap.min.css')?>" type="text/css">
    <link rel="stylesheet" href="<?php echo asset('css/print.css')?>" type="text/css" media="all">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <h3><?php echo $report->name;?></h3>
                <?php if (strlen($report->description) > 0) {
                    echo "<p>" . $report->description . "</p>";
                }?>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="report">
                    <table class="table table-striped">
                        <thead>
                        <tr class="grouping">
                            <?php
                            $n_columns = count($report->options->columns);
                            for ($i=0;$i<$n_columns;$i++) {?>
                                <th><div style="page-break-inside: avoid;"><?php echo $report->options->columns[$i]->text;?></div></th>
                            <?php }?>
                        </tr>
                        </thead>
                        <tbody>
                            <?php
                            $n_groups = count($data);
                            $n_sort = count($report->options->sort);
                            for ($i=0;$i<$n_groups;$i++) {
                                $group = $data[$i];
                                if ($n_sort > 0) {?>
                                <tr>
                                    <td colspan="<?php echo $n_columns;?>">
                                        <?php
                                        $headers = [];
                                        foreach ($report->options->sort as $sorting) {
                                            $headers[] = $group[$sorting->field];
                                        }
                                        $headers = implode(' &mdash; ',$headers);
                                        $n_records = count($group['data']);
                                        ?>
                                        <div style="page-break-inside: avoid">
                                            <strong><?php echo $headers?></strong> <em>(<?php echo $n_records?> records)</em>
                                        </div>
                                    </td>
                                </tr>
                                <?php }?>
                                <?php
                                foreach ($group['data'] as $record) {
                                    ?>
                                    <tr>
                                    <?php foreach ($report->options->columns as $column) {
                                    ?>
                                    <td><div style="page-break-inside: avoid"><?php
                                            if ($field_type[$column->value] == 'date') {
                                                $column_value = $column->value;
                                                $format = 'm-d-y';
                                                if ($column_value == 'appt_date' || $column_value == 'date_moved') {
                                                    $format = 'm-d-Y';
                                                } elseif ($column_value == 'date_of_referral' || $column_value == 'date_received') {
                                                    $format = 'm-d';
                                                }
                                                if (strlen($record[$column->value]) > 0) {
                                                    $time = strtotime(str_replace('T',' ',$record[$column->value]));
                                                    echo '<span class="nowordwrap">' . date($format,$time) . '</span>';
                                                }
                                            } elseif ($column->value == 'patient_treating' || $column->value == 'is_doctor_mpn') {
                                                echo ($record[$column->value] == 1)? 'Yes' : '';
                                            } else {
                                                echo $record[$column->value];
                                            }
                                        ?></div></td>
                                    <?php
                                    }?>
                                    </tr>
                                <?php }?>
                            <?php }?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        window.print();
    </script>
</body>
</html>