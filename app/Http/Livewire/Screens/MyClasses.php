<?php

namespace App\Http\Livewire\Screens;

use App\Models\Classes;
use Auth;
use Livewire\Component;

class MyClasses extends Component
{
    public function mount()
    {
        $id = Auth::user()->data->get('class_id', '');
        $this->class = Classes::find($id);
        $this->date = Auth::user()->data->get('date', '');
        $this->timeSlot = Auth::user()->data->get('time_slot', '');
    }

    public function render()
    {
        return view('livewire.screens.my-classes', [
            'class' => $this->class,
            'date' => date_format(date_create($this->date), 'd F'),
            'timeSlot' => $this->timeSlot,
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);
    }
}
