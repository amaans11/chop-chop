<?php

namespace App\Imports;

use App\Models\Category;
use App\Models\Subcategory;
use File;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use stdClass;

class SubcategoryImport implements ToModel, WithStartRow
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

        $subcategory = new Subcategory([
            'title'     => $row[0],
            'slug'     => $row[1],
            'category_id'    => Category::where('slug', $row[2])->first()->id,
            'description' => $row[3],
            'data' => json_encode(['color' => $row[5], 'bgColor' => $row[4]])
        ]);


        if($row[3] && File::exists(resource_path('uploads/subcategory/').$row[3])){
            $subcategory
            ->addMedia(resource_path('uploads/subcategory/').$row[3])
            ->preservingOriginal()
            ->toMediaCollection('subcategories_hero_image');
            }

        return $subcategory;
    }
}
