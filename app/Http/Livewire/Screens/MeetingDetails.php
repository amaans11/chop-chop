<?php

namespace App\Http\Livewire\Screens;

use Livewire\Component;

class MeetingDetails extends Component
{
    public function mount($id)
    {
        $this->meeting = \App\Models\Meetings::find($id);
    }

    public function render()
    {
        return view('livewire.screens.meeting-details',[
            'meeting' => $this->meeting
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);
    }
}
