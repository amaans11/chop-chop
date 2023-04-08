<?php

namespace App\View\Components\Cards;

use App\Models\Classes;
use Illuminate\View\Component;

class LiveClassCard extends Component
{
    public Classes $class;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($class)
    {
        $this->class = $class;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.cards.live-class-card');
    }
}
