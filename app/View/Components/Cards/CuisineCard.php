<?php

namespace App\View\Components\Cards;

use App\Models\Subcategory;
use Illuminate\View\Component;

class CuisineCard extends Component
{
    public Subcategory $cuisine;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($cuisine)
    {
        $this->cuisine = $cuisine;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.cards.cuisine-card');
    }
}
