<?php

namespace App\Http\Livewire\Screens;

use App\Models\Category;
use App\Models\Subcategory;
use Auth;
use Livewire\Component;

class Cuisines extends Component
{
    public string $cuisine='';

    protected $rules = [
        'cuisine' => ['required', 'string'],
    ];

    public function updatedCuisine($value)
    {
        $this->validate();

        $user = Auth::user();
        $user->data->put('cuisine', $value);
        $user->save();

        return redirect()->route('dashboard');
    }
    public function backHandler(){
        return redirect()->route('sessionType');
    }

    public function render()
    {
        $category = Category::where('slug','cuisines')->first();
        // $all = Subcategory::where('slug','all-cuisines')->get();

        $cuisines = Subcategory::where('category_id',$category->id)
            ->where('slug', '<>', 'all-cuisines')
            ->get();

        return view('livewire.screens.cuisines',['cuisines'=>$cuisines])
        ->layout('layouts.app')
        ->layoutData([
            'showLogo' => false,
        ]);
    }
}
