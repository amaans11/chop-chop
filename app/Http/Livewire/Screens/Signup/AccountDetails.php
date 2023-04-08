<?php

namespace App\Http\Livewire\Screens\Signup;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class AccountDetails extends Component
{
    public string $email = '';
    public string $password = '';

    protected $rules = [
        'email' => ['required', 'email', 'unique:users,email'],
        'password' => ['required', 'min:8'],
    ];

    public function submit()
    {
        $this->validate();

        $user = Auth::user();
        $user->update([
            'email' => $this->email,
            'password' => bcrypt($this->password),
        ]);

        return redirect()->route('dashboard');
    }

    public function render()
    {
        return view('livewire.screens.signup.account-details')
            ->layout('layouts.guest');
    }
}
