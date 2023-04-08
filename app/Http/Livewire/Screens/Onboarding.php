<?php

namespace App\Http\Livewire\Screens;

use Livewire\Component;

class Onboarding extends Component
{
    public function render()
    {
        return view('livewire.screens.onboarding')
            ->layout('layouts.guest');
    }
}
