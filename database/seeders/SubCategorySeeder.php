<?php

namespace Database\Seeders;

use App\Imports\SubcategoryImport;
use Illuminate\Database\Seeder;
use Maatwebsite\Excel\Facades\Excel;

class SubCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Excel::import(new SubcategoryImport, 'database/data/subcategories.csv');
    }
}
