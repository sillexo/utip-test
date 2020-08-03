<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('create-comment', function ($user) {
            return ! $user->isBlocked();
        });
        Gate::define('update-comment', function ($user) {
            return ! $user->isBlocked();
        });
        Gate::define('articles-manage', function ($user) {
            return $user->isManager() || $user->isAdmin();
        });
        Gate::define('users-manage', function ($user) {
            return $user->isAdmin();
        });
        Gate::define('roles-manage', function ($user) {
            return $user->isAdmin();
        });
    }
}
