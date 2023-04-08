<?php

namespace App\Http\Livewire\Screens;

use Livewire\Component;

class ClassDetails extends Component
{
    public function mount($id)
    {
        $this->class = \App\Models\Classes::find($id);
    }

    public function render()
    {
        return view('livewire.screens.class-details')
        ->layout('layouts.app')
        ->layoutData([
            'showLogo' => false,
        ]);
    }
}
