<?php

namespace App\Http\Livewire\Screens;

use App\Models\Classes;
use App\Models\UserReview;
use Auth;
use Livewire\Component;

class ClassInfo extends Component
{
    public string $timeSlot = '';
    public string $datepickerValue = '17-11-2021';

    protected $rules = [
        'timeSlot' => ['required', 'string'],
    ];

    public function mount($id)
    {
        $this->class = Classes::find($id);
        $this->reviews = UserReview::where('class_id', $id)->get();
    }

    public function confirmSlot()
    {
        $this->validate();
        $morningSlots=['7:00 am','7:30 am','8:00 am','8:30 am','9:00 am','9:30 am','10:00 am','10:30 am','11:00 am','11:30 am'];
        $noonSlots=['12:00 pm','12:30 pm','1:00 pm','1:30 pm','2:00 pm','2:30 pm','3:00 pm'];

        $slot = in_array($this->timeSlot,$morningSlots) ? 'morning' : (in_array($this->timeSlot,$noonSlots) ? 'noon' :' evening');

        $user = Auth::user();
        $user->data->put('class',$this->class->slug);
        $user->data->put('slot_selection',['selected_date'=>$this->datepickerValue,'time_slot'=>$this->timeSlot,'slot'=> $slot,'current_date' => date("d-m-Y")]);

        $user->save();

        return redirect()->route('review', ['id' => $this->class->id]);
    }
    public function backHandler(){
        return redirect()->route('dashboard');
    }

    public function render()
    {
        $options = [
            'morning'=>['title'=>'Morning','icon'=> asset('images/icons/sunrise.png'),'timeslots'=>['7:00 am']],
            'evening'=>['title'=>'Evening','icon'=> asset('images/icons/night-mode.png'),'timeslots'=>['7:00 pm']],
        ];

        return view('livewire.screens.class-info', [
            'timeslots' => $options,
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);
    }
}
