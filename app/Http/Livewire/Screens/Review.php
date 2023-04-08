<?php

namespace App\Http\Livewire\Screens;

use App\Models\Classes;
use App\Models\UserReview;
use Auth;
use Livewire\Component;

class Review extends Component
{
    public string $timeSlot = '';
    public string $datepickerValue = '';
    public  $class;

    public function mount()
    {
        $slug = Auth::user()->data->get('class', '');
        $this->class = Classes::where('slug',$slug)->first();
        $this->datepickerValue = Auth::user()->data->get('date', '');
        $this->timeSlot = Auth::user()->data->get('time_slot', '');
    }

    public function confirmSlot()
    {
        $user = Auth::user();
        $user->data->put('class_id', $this->class->id);
        $user->data->put('time_slot', $this->timeSlot);
        $user->data->put('date', $this->datepickerValue);

        $user->save();

        return redirect()->route('review', ['id' => $this->class->id]);
    }

    public function backHandler()
    {
        return redirect()->route('classInfo', ['id' => $this->class->id]);
    }

    public function submitHandler()
    {
        $user = Auth::user();
        $user->data->put('review', 'confirm-slot');
        $user->save();

        return redirect()->route('confirmation', ['id' => $this->class->id]);
    }
    public function subscribeHandler()
    {
        $user = Auth::user();
        $user->data->put('review', 'subscribe');
        $user->save();

        return redirect()->route('confirmation', ['id' => $this->class->id]);
    }

    

    public function render()
    {
        $options = [
            'morning'=>['title'=>'Morning','icon'=> asset('images/icons/sunrise.png'),'timeslots'=>['7:00 am','7:30 am','8:00 am','8:30 am','9:00 am','9:30 am','10:00 am','10:30 am','11:00 am','11:30 am']],
            'noon'=>['title'=>'Noon','icon'=> asset('images/icons/sun.png'),'timeslots'=>['12:00 pm','12:30 pm','1:00 pm','1:30 pm','2:00 pm','2:30 pm','3:00 pm']],
            'evening'=>['title'=>'Evening','icon'=> asset('images/icons/night-mode.png'),'timeslots'=>['5:30 pm','5:30 pm','6:00 pm','6:30 pm','7:00 pm','7:30 pm','8:00 pm','8:30 pm','9:00 pm']],
        ];
        return view('livewire.screens.review', [
            'date' => date_format(date_create($this->datepickerValue), 'd F'),
            'timeslots' => $options,
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);
    }
}
