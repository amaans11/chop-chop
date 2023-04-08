<?php

namespace Database\Seeders;

use App\Imports\ClassesImport;
use App\Imports\ClassesSubcategoriesImport;
use App\Models\ClassSubcategory;
use App\Models\Subcategory;
use Illuminate\Database\Seeder;
use Maatwebsite\Excel\Facades\Excel;

class ClassesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $csvFile = fopen(base_path("database/data/classes.csv"), "r");
        $firstline = true;

        Excel::import(new ClassesImport, 'database/data/classes.csv');
  
        while (($data = fgetcsv($csvFile, 2000, ",")) !== FALSE) {
            if (!$firstline) {
                $subCategories = explode('|', $data['4']);
                ClassSubcategory::create([
                    "class_id" => $data['0'],
                    "subcategory_id" => Subcategory::where('slug', $subCategories[0])->first()?->id
                ]); 
                ClassSubcategory::create([
                    "class_id" => $data['0'],
                    "subcategory_id" => Subcategory::where('slug', $subCategories[1])->first()?->id
                ]);    
            }
            $firstline = false;
        }
   
        fclose($csvFile);
      
    }
}
