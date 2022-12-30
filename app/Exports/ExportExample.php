<?php

namespace App\Exports;

use App\Models\ExampleModel;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;


use Illuminate\Contracts\View\View;

class ExportExample implements FromView, WithHeadings, ShouldAutoSize, WithEvents{
    protected $datas;
    protected $title;
    protected $date;

    public function __construct($datas = null,$title=null,$date=null)
    {
        $this->datas = $datas;
        $this->title = $title;
        $this->date = $date;
    }
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return ExampleModel::all();
    }

    public function view():View{
        return view('master.example.example-pdf', [
            'title'=>$this->title,
            'date'=>$this->date,
            'example' => $this->datas
        ]);
    }

    private $headings = [
        'Date Created',
        'MSISDN',
        'game_code',
        'Answer',
        'Channel'
    ];
    public function headings(): array
    {
        return $this->headings;
    }


    public function registerEvents(): array
    {
        return [
            AfterSheet::class    => function (AfterSheet $event) {
                $cellRange = 'A1:E1'; // All headers
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(14);
            },


        ];
    }
}
