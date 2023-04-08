<?php

namespace App\Imports;

use App\Models\Classes;
use App\Models\Meetings;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class MeetingsImport implements ToModel, WithStartRow
{
    public function startRow(): int
    {
        return 2;
    }

    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        $meeting = new Meetings([
            'title'     => $row[0],
            'class_id'     => Classes::where('slug', $row[2])->first()?->id,
            'time'    => $row[4],
            'status' => $row[1],
            'zoom_link_url' => $row[5],
            'video_recording_url' => $row[6],
        ]);
        $meeting
        ->addMedia(resource_path('uploads/meetings/').$row[3])
        ->toMediaCollection('meetings');

        return $meeting;
    }
}
