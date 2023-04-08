<?php

namespace Database\Seeders;

use App\Imports\CategoryImport;
use Illuminate\Database\Seeder;
use Maatwebsite\Excel\Facades\Excel;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Excel::import(new CategoryImport, 'database/data/categories.csv');
    }
}
