<?php

namespace App\Http\Livewire\Screens;

use Livewire\Component;

class Meetings extends Component
{
    public function render()
    {
        return view('livewire.screens.meetings',[
            'meetings' => \App\Models\Meetings::all()
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);
    }

    public function infoHandler($meeting_id)
    {
        return redirect()->route('meeting_details', ['id' => $meeting_id]);
    }
}
