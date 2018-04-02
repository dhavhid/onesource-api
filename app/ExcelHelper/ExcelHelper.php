<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 10/3/15
 * Time: 10:39 AM
 */

namespace OneSource\ExcelHelper;
use Illuminate\Support\Facades\Facade;
use Illuminate\Support\Facades\Config;
use Excel;
use Carbon\Carbon;
use OneSource\ViewReport;

class ExcelHelper extends Facade
{
    protected $sheetColumns = ['1'=>'A','2'=>'B','3'=>'C','4'=>'D','5'=>'E','6'=>'F','7'=>'G',
        '8'=>'H','9'=>'I','10'=>'J','11'=>'K','12'=>'L','13'=>'M','14'=>'N','15'=>'O','16'=>'P',
        '17'=>'Q','18'=>'R','19'=>'S','20'=>'T','21'=>'U','22'=>'V','23'=>'W','24'=>'X','25'=>'Y',
        '26'=>'Z'];

    protected $fontSheet = ['font' => [
        'name' => 'Arial',
        'size' => 10
        ]];
    protected static function getFacadeAccessor() { return 'ExcelHelper'; }

    public function generateReport($data)
    {
        $options = json_decode(json_encode($data['report']['options']), true);
        $n_columns = count($options['columns']);
        $viewReport = new ViewReport();
        $columnD = $this->getColumnName($n_columns);
        $headers = array_pluck($options['columns'],'text');
        $dataKeys = array_pluck($options['columns'],'value');
        $fontSheet = $this->fontSheet;

        $excel = Excel::create($options['name'] . ' - ' . Carbon::now()->toDateTimeString(), function($doc) use($data,$options,$n_columns,$viewReport,$columnD,$headers,$dataKeys,$fontSheet){
            $doc->setTitle($options['name']);
            if (isset($options['description_on_report_page']) && $options['description_on_report_page'] == 1 && isset($options['description'])) {
                $doc->setDescription($options['description']);
            }
            // add the doc
            $doc->sheet('Data',function($sheet) use($data,$options,$n_columns,$viewReport,$columnD,$headers,$dataKeys,$fontSheet){
                $sheet->setStyle($fontSheet);
                $sheet->setFontFamily('Arial')->setFontSize(10);
                $sheet->freezeFirstRow();
                $this->setHeader($options,$sheet,$columnD,$headers);
                if (isset($data['group_fields'])) { //parse as grouped results
                    $row = 2;
                    foreach($data['data'] as $datan) {
                        $groupHeader = [];
                        foreach ($data['group_fields'] as $group_field) {
                            $groupHeader[] = $datan[$group_field];
                        }
                        $this->setGroupHeader($sheet,implode(' - ',$groupHeader),$columnD,$row);
                        $row++;
                        // set data for current resultSet.
                        $this->setData($sheet,$datan['data'],$headers,$dataKeys,$options,$n_columns,$columnD,$viewReport,$row);
                        $row += count($datan['data']);
                    }
                } else {
                    $this->setData($sheet,$data['data'][0]['data'],$headers,$dataKeys,$options,$n_columns,$columnD,$viewReport,2);
                }
            });
            // now add the summary table if exists.
            if (isset($data['group_fields'])) {
                $doc->sheet('Summary',function($sheet) use($data,$options,$n_columns,$viewReport,$columnD,$headers,$dataKeys,$fontSheet) {
                    $sheet->freezeFirstRow();
                    $sheet->setStyle($fontSheet);
                    $sheet->setFontFamily('Arial')->setFontSize(10);
                    // header of summary table
                    $sheet->row(1,['Summary','Total']);
                    $sheet->cells("A1:B1",function($cells){
                        $cells->setBackground('#18BC9C')
                            ->setFontSize(11)
                            ->setFontColor('#FFFFFF')
                            ->setFontWeight('bold')
                            ->setAlignment('center')
                            ->setValignment('middle');
                    });
                    $sheet->setBorder("A1:B1",'thin');
                    // ---------------------------------------
                    $i = 2;
                    $total_total = 0;
                    foreach($data['totals'] as $total) {
                        $groupHeader = [];
                        foreach ($data['group_fields'] as $group_field) {
                            $groupHeader[] = $total[$group_field];
                        }
                        $sheet->row($i,[implode(' - ',$groupHeader),$total['total']]);
                        $i++;
                        $total_total += (int)$total['total'];
                    }
                    // ---------------------------------------
                    $sheet->row($i,['Total',$total_total]);
                    $sheet->cells("A{$i}:B{$i}",function($cells){
                        $cells->setBackground('#DDDDDD')
                            ->setFontSize(11)
                            ->setFontColor('#000000')
                            ->setFontWeight('bold')
                            ->setAlignment('right')
                            ->setValignment('middle');
                    });
                    $sheet->setBorder("A{$i}:B{$i}",'thin');
                });
            }
        });
        return $excel;
    }

    public function setHeader($options,$sheet,$columnD,$headers)
    {
        /*$cellRange = "A1:{$columnD}2";
        $sheet->cells($cellRange,function($cells){
            $cells->setFontSize(11)
                ->setAlignment('center')
                ->setValignment('middle');
        });
        $sheet->mergeCells("A1:{$columnD}1");
        $sheet->row(1,[Config::get('constants.appname')]);
        $sheet->mergeCells("A2:{$columnD}2");
        $sheet->row(2,[$options['name']]);*/
        $cellRange = "A1:{$columnD}1";
        $sheet->cells($cellRange,function($cells){
            $cells->setBackground('#18BC9C')
                ->setFontSize(11)
                ->setFontColor('#FFFFFF')
                ->setFontWeight('bold')
                ->setAlignment('center')
                ->setValignment('middle');
        });
        $sheet->setBorder($cellRange,'thin');
        $sheet->row(1,$headers);
    }

    public function setData($sheet,$data,$headers,$dataKeys,$options,$n_columns,$columnD,$viewReport,$n_row)
    {
        $n_data = count($data);
        for($i=0;$i<$n_data;$i++) {
            $resultSet = [];
            foreach($dataKeys as $key) {
                if (isset($viewReport->field_type[$key]) && $viewReport->field_type[$key] == 'date') {
                    $data[$i][$key] = $this->setDate($data[$i][$key],$key,$viewReport);
                }
                $resultSet[] = $data[$i][$key];
            }
            $sheet->row($n_row,$resultSet);
            $n_row++;
        }
    }

    public function setGroupHeader($sheet,$groupHeader,$columnD,$row)
    {
        $groupRange = "A{$row}:{$columnD}{$row}";
        $sheet->mergeCells($groupRange);
        $sheet->cell("A{$row}",function($cell){
            $cell->setBackground('#DDDDDD')
                ->setFontSize(10)
                ->setFontWeight('bold')
                ->setFontColor('#000000')
                ->setAlignment('left')
                ->setValignment('middle');
        });
        $sheet->cell("A{$row}",$groupHeader);
    }

    public function getColumnName($n)
    {
        $totalColumns = count($this->sheetColumns);
        // first thing I do is to see how many times the current row overflows the alphabet.
        if ($totalColumns >= $n) {
            return $this->sheetColumns[$n];
        } else {
            $overflow = floor($n/$totalColumns);
            $column = $this->sheetColumns[$overflow];
            $column .= $this->sheetColumns[($n - ($overflow*$totalColumns))];
        }
        return $column;
    }

    protected function setDate($record,$key,$viewReport)
    {
        if (isset($viewReport->field_date_format[$key])) {
            $record = date($viewReport->field_date_format[$key],strtotime($record));
        }
        return $record;
    }
}