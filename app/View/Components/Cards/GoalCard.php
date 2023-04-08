<?php

namespace App\View\Components\Cards;

use App\Models\Subcategory;
use Illuminate\View\Component;

class GoalCard extends Component
{
    public Subcategory $subcategory;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($subcategory)
    {
        $this->subcategory = $subcategory;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.cards.goal-card');
    }
}
