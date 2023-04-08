<?php

namespace App\Imports;

use App\Models\Classes;
use App\Models\UserReview;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class UserReviewsImport implements ToModel, WithStartRow
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
        foreach (explode('|', $row[3]) as $class) {
            return new UserReview([
                'user_id' => $row[0],
                'class_id' => Classes::where('slug', $class)->first()?->id,
                'text' => $row[1],
                'rate' => $row[2],
            ]);
        }
    }
}
