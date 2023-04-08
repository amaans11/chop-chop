<?php

namespace App\Http\Livewire\Screens\Signup;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class CookingFrequency extends Component
{
    public string $cookingFrequency = '';

    protected $rules = [
        'cookingFrequency' => ['required', 'string'],
    ];

    public function mount()
    {
        $this->cookingFrequency = Auth::user()->tagsWithType('cookingFrequency')->first()?->name ?? '';
    }

    public function submit()
    {
        $this->validate();

        $user = Auth::user();
        $user->syncTagsWithType([$this->cookingFrequency], 'cookingFrequency');

        return redirect()->route('signup.dietGoals');
    }

    public function render()
    {
        $options = [
            '1_2_times_week' => '1-2 times / week',
            '3_6_times_week' => '3-6 times / week',
            '5_more_times_week' => '5+ times / week',
        ];

        return view('livewire.screens.signup.cooking-frequency', [
            'options' => $options
        ])
            ->layout('layouts.guest');
    }
}
