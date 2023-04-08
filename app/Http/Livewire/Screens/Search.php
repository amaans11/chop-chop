<?php

namespace App\Http\Livewire\Screens;

use App\Models\Category;
use App\Models\Classes;
use Livewire\Component;

class Search extends Component
{
    public function render()
    {
        return view('livewire.screens.search',[
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);
    }
}
