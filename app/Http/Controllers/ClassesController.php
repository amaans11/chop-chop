<?php

namespace App\Http\Controllers;

use App\Models\Classes;

class ClassesController extends Controller
{
    public function __construct()
    {
    }

    public function search($keyphrase)
    {
        $classes = Classes::search($keyphrase)->with('owner','userReviews.user')->get();

        return response()->json($classes);
    }
}
