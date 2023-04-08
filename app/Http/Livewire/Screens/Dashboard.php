<?php

namespace App\Http\Livewire\Screens;

use App\Models\Category;
use App\Models\Classes;
use App\Models\Subcategory;
use Auth;
use Livewire\Component;

class Dashboard extends Component
{
    public string $type = 'quick-cook';
    public $subCategories;
    public string $cuisine='';
    public string $subCategory = '';

    public function mount(){
        $user = Auth::user();

        if (!$user->data->get('subCategory')) return redirect()->route('sessionType');
        if (!$user->data->get('cuisine')) return redirect()->route('cuisines');

        $this->cuisine = $user->data->get('cuisine');
        $this->subCategory = $user->data->get('subCategory');
    }
    public function handleType($value){
        $this->type = $value;

        $this->subCategories = Category::where('slug',$value)->first()->subcategories;

        $subCatgory_slug = $this->subCategories->first()->slug;
        $this->subCategory = $subCatgory_slug;

        $user = Auth::user();
        $user->data->put('subCategory', $subCatgory_slug);
        $user->save();

    }

    public function updatesubCategory($value){
        $this->subCategory = $value['slug'];

        $user = Auth::user();
        $user->data->put('subCategory', $value['slug']);
        $user->save();

    }
    public function updateCuisine($value){
        $this->cuisine = $value['slug'];

        $user = Auth::user();
        $user->data->put('cuisine', $value['slug']);
        $user->save();

    }
    public function handleClassDetail($id){
        $user = Auth::user();
        $user->data->put('result-selection', Classes::find($id)->slug);
        $user->save();

        return redirect()->route('classInfo', ['id' => $id]);
    }
    public function render()
    {
        $this->subCategories = Category::where('slug',$this->type)->first()->subcategories;

        $cuisineClasses_ids = SubCategory::where('slug',$this->cuisine)->first()->classes->pluck('id');
        $subCatClasses_ids = SubCategory::where('slug',$this->subCategory)->first()->classes->pluck('id');

        $final_ids = $cuisineClasses_ids->intersect($subCatClasses_ids);
        if ($this->cuisine == 'all-cuisines') {
            $final_ids = $subCatClasses_ids;
        }


        $allSubCategories = Subcategory::where('slug','all-cuisines')->first();
        $cuisines = Category::where('slug', 'cuisines')->first()->subcategories->prepend($allSubCategories);
        $cuisines->pop();

        return view('livewire.screens.dashboard', [
            'classes' => Classes::whereIn('id', $final_ids)->get(),
            'subcategories' => Subcategory::withCount('classes')->get(),
            'cuisines' => $cuisines,
        ])
            ->layout('layouts.app')
            ->layoutData([
                'showLogo' => false,
            ]);
    }
}
