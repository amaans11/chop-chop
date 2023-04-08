<?php

namespace App\Http\Livewire\Screens\Signup;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Livewire\Component;

class AboutMe extends Component
{
    public string $name = '';
    public string $cookingLevel = '';

    protected $rules = [
        'name' => ['required', 'string'],
        'cookingLevel' => ['required', 'string'],
    ];

    public function mount()
    {
        $this->name = Auth::user()?->name ?? '';
        $this->cookingLevel = Auth::user()?->tagsWithType('cookingLevel')->first()?->name ?? '';
    }

    public function submit()
    {
        $this->validate();

        $user = Auth::user();

        if(!$user) {
            $user = User::create([
                'name' => $this->name,
                'email' => Str::random(10) . '@example.com',
                'password' => bcrypt(Str::random(10))
            ]);
            Auth::login($user);
        } else {
            $user->name = $this->name;
            $user->save();
        }

        $user->syncTagsWithType([$this->cookingLevel], 'cookingLevel');

        return redirect()->route('signup.cookingFrequency');
    }

    public function render()
    {
        $options = [
            'beginner' => 'Beginner',
            'intermediate' => 'Intermediate',
            'expert' => 'Expert',
        ];

        return view('livewire.screens.signup.about-me', [
            'options' => $options
        ])
            ->layout('layouts.guest');
    }
}
