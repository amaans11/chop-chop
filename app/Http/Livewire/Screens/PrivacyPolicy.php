<?php

namespace App\Http\Livewire\Screens;

use Livewire\Component;

class PrivacyPolicy extends Component
{
    public function backHandler(){
        return redirect()->route('account');
    }
    public function render()
    {
        return view('livewire.screens.privacy-policy')
            ->layout('layouts.app',[
                'showLogo'=> false
            ]);
    }
}
