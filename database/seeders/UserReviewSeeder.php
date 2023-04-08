<?php

namespace Database\Seeders;

use App\Imports\UserReviewsImport;
use Illuminate\Database\Seeder;
use Maatwebsite\Excel\Facades\Excel;

class UserReviewSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Excel::import(new UserReviewsImport, 'database/data/user-reviews.csv');
    }
}
