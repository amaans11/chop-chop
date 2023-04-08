<?php

namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class UsersImport implements ToModel, WithStartRow
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
        $user = new User([
            'id'     => $row[0],
            'name'     => $row[1],
            'email'    => $row[2],
            'password' => bcrypt(($row[3])),
            'role' => $row[4],
        ]);
       if($row[5]){
        $user
        ->addMedia(resource_path('uploads/users/').$row[5])
        ->preservingOriginal()
        ->toMediaCollection('users');
       }
        return $user;
    }
}
