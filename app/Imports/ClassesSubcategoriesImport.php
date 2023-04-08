<?php

namespace App\Imports;

use App\Models\ClassSubcategory;
use App\Models\Subcategory;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class ClassesSubcategoriesImport implements ToModel, WithStartRow
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
        $subCategories = explode('|', $row[4]);
        return new ClassSubcategory([
            'class_id' => $row[0],
            'subcategory_id' => Subcategory::where('slug', $subCategories[0])->first()?->id,
        ]);
         new ClassSubcategory([
            'class_id' => $row[0],
            'subcategory_id' => Subcategory::where('slug', $subCategories[1])->first()?->id,
        ]);
    }
}
