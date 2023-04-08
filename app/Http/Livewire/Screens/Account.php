<?php

namespace App\Http\Livewire\Screens;

use App\Models\Classes;
use Auth;
use Livewire\Component;

class Account extends Component
{
    public function mount()
    {
        $id = Auth::user()->data->get('class_id', '');
        $this->class = Classes::find($id);
        $this->selectedDate = Auth::user()->data->get('date', '');
        $this->timeSlot = Auth::user()->data->get('time_slot', '');
    }

    public function render()
    {
        return view('livewire.screens.account', [
            'class' => $this->class,
            'date' => date_format(date_create($this->selectedDate), 'd F'),
            'timeSlot' => $this->timeSlot,
        ])
            ->layout('layouts.app',[
                'showLogo'=> false
            ]);
    }
}
