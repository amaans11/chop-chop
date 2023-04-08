<?php

namespace App\Http\Livewire\Screens;

use Livewire\Component;

class TermsOfUse extends Component
{
    public function backHandler(){
        return redirect()->route('account');
    }
    public function render()
    {
        return view('livewire.screens.terms-of-use')
            ->layout('layouts.app',[
                'showLogo'=> false
            ]);
    }
}
