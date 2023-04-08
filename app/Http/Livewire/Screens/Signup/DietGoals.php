<?php

namespace App\Http\Livewire\Screens\Signup;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class DietGoals extends Component
{
    public string $haveRestrictions = 'false';
    public array $dietGoals = [];
    public array $restrictions = [];

    protected $rules = [
        'dietGoals' => ['required', 'array'],
        'dietGoals.*' => ['required', 'string'],
        'restrictions' => ['exclude_if:haveRestrictions,false', 'required', 'array'],
        'restrictions.*' => ['exclude_if:haveRestrictions,false', 'required', 'string'],
    ];

    public function mount()
    {
        $this->haveRestrictions = Auth::user()->tagsWithType('restrictions')->isEmpty() ? 'false' : 'true';
        $this->dietGoals = Auth::user()->tagsWithType('dietGoals')->pluck('name')->toArray() ?? [];
        $this->restrictions = Auth::user()->tagsWithType('restrictions')->pluck('name')->toArray() ?? [];
    }

    public function submit()
    {
        $this->validate();

        $user = Auth::user();
        $user->syncTagsWithType($this->dietGoals, 'dietGoals');
        $user->syncTagsWithType($this->haveRestrictions === 'true' ? $this->restrictions : [], 'restrictions');
        $user->save();

        return redirect()->route('signup.accountDetails');
    }

    public function render()
    {
        $dietGoalOptions = [
            'more_energy' => 'More energy',
            'weight_loss' => 'Weight loss',
            'balanced_diet' => 'Balanced diet',
            'weight_gain' => 'Weight gain',
            'start_new_diet' => 'Start new diet',
            'anti_aging' => 'Anti-aging',
            'other' => 'Other',
        ];

        $restrictionOptions = [
            'gluten' => 'Gluten',
            'halal' => 'Halal',
            'sugar' => 'Sugar',
            'seafood' => 'Seafood',
            'nuts' => 'Nuts',
            'lactose' => 'Lactose',
            'sodium' => 'Sodium',
            'other' => 'Other',
        ];

        return view('livewire.screens.signup.diet-goals', [
            'dietGoalOptions' => $dietGoalOptions,
            'restrictionOptions' => $restrictionOptions,
        ])
            ->layout('layouts.guest');
    }
}
