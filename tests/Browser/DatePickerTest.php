<?php

namespace Tests\Browser;

use Laravel\Dusk\Browser;
use Tests\DuskTestCase;

class DatePickerTest extends DuskTestCase
{
    /**
     * A Dusk test example.
     *
     * @return void
     */
    public function test_date_picker()
    {
        $this->browse(function (Browser $browser) {
            $browser
                    ->visit('/login')
                    ->pause(1000)
                    ->type('@email', 'john@example.com')
                    ->type('@password', 'john123')
                    ->press('@submit')
                    ->pause(2000)
                    ->assertPathIs('/dashboard')
                    ->click('.dusk-class-1')
                    ->pause(4000)
                    ->click('.date-btn')
                    ->pause(3000)
                    ->press('@confirm-slot')
                    ->pause(3000)
                    ->assertPathIs('/review')
                    ->press('@confirmBtn')
                    ->pause(2000)
                    ->assertPathIs('/confirmation');
        });
    }
}
