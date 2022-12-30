<?php

namespace App\Listeners;

use Illuminate\Auth\Events\Login;
use App\Helpers\RBACHelper;

class SetUserSessions
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle(Login $event)
    {
        RBACHelper::initSession();
    }
}
