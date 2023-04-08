<?php

namespace App\Imports;

use App\Models\Classes;
use File;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class ClassesImport implements ToModel, WithStartRow
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
        $class = new Classes([
            'id' => $row[0],
            'owner_id'     => $row[1],
            'title'     => $row[2],
            'slug'    => $row[3],
            'description' => $row[6],
            'duration' => $row[8],
            'price' => $row[9],
            'level' => $row[10],
            'utensils' => $row[11],
            'ingredients' => $row[12],
            'steps' => $row[13],
        ]);
        if(File::exists(resource_path('uploads/classes/').$row[5])){
            $class
            ->addMedia(resource_path('uploads/classes/').$row[5])
            ?->preservingOriginal()
            ->toMediaCollection('classes_hero_image');
        }
       

        return $class;
    }
}
