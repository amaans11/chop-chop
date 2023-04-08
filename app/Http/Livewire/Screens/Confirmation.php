<?php

namespace App\Http\Livewire\Screens;

use App\Models\Classes;
use Auth;
use Livewire\Component;

class Confirmation extends Component
{
    public string $timeSlot = '';
    public string $datepickerValue = '';

    public function mount()
    {
        $slug = Auth::user()->data->get('class', '');
        $this->class = Classes::where('slug',$slug)->first();
        $this->datepickerValue = Auth::user()->data->get('date', '');
        $this->timeSlot = Auth::user()->data->get('time_slot', '');
    }


    public function backHandler()
    {
        return redirect()->route('review', ['id' => $this->class->id]);
    }

    public function render()
    {
        return view('livewire.screens.confirmation', [
            'class' => $this->class,
            'date' => date_format(date_create($this->datepickerValue), 'd F'),
            'timeSlot' => $this->timeSlot,
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => true,
            ]);
    }
}
