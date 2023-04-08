<?php

namespace App\Http\Livewire\Screens;

use App\Models\Subcategory;
use Livewire\Component;
use App\Models\Classes;

class Welcome extends Component
{
    public function render()
    {
        return view('livewire.screens.welcome',[
            'classes' => Classes::latest()->take(5)->get(),
            'subCategories' => Subcategory::latest()->take(10)->get(),
        ])
            ->layout('layouts.guest', ['showLogo' => false] );
    }
}
