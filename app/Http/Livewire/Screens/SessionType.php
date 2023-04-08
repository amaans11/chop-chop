<?php

namespace App\Http\Livewire\Screens;

use App\Models\Category;
use App\Models\Subcategory;
use Auth;
use Livewire\Component;

class SessionType extends Component
{
    public string $subcategory = '';

    protected $rules = [
        'subcategory' => ['required', 'string'],
    ];

    public function updatedSubcategory($value)
    {
        $this->validate();

        $user = Auth::user();
        $user->data->put('subCategory', $value);
        $user->save();

        return redirect()->route('cuisines');
    }

    public function render()
    {
        $popular = Category::where('slug','popular')->first();
        $quickCook = Category::where('slug','quick-cook')->first();

        $popularSubCategories = Subcategory::withCount('classes')->where('category_id',$popular->id)->get();
        $quickCookSubCategories = Subcategory::withCount('classes')->where('category_id',$quickCook->id)->get();

        return view('livewire.screens.session-type',[
            'popularSubCategories' => $popularSubCategories,
            'quickCookSubCategories' => $quickCookSubCategories,
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);

    }
}
