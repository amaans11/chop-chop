<?php

namespace App\Http\Livewire\Screens;

use Livewire\Component;

class Classes extends Component
{
    public function render()
    {
        return view('livewire.screens.classes')
        ->layout('layouts.app')
        ->layoutData([
            'showLogo' => false,
        ]);
    }

    public function infoHandler($class_id)
    {
        return redirect()->route('class_details', ['id' => $class_id]);
    }
}
