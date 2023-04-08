<?php

namespace App\Imports;

use App\Models\Category;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class CategoryImport implements ToModel, WithStartRow
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
        $category = new Category([
            'id'     => $row[0],
            'title'     => $row[1],
            'slug'    => $row[2],
            'description' => $row[3],
        ]);
        $category
        ->addMedia(resource_path('uploads/category/').$row[4])
        ->preservingOriginal()
        ->toMediaCollection('categories');

        return $category;
    }
}
