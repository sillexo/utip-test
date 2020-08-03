<?php

namespace App;

/**
 * Class UserAccess.
 */
trait UserAccess
{
    public function isAdmin()
    {
        return $this->hasRole('admin');
    }

    public function isManager()
    {
        return $this->hasRole('manager');
    }

    public function isUser()
    {
        return $this->hasRole('user');
    }

    public function isBlocked()
    {
        return (bool) ! $this->status;
    }
    
    /**
     * Checks if the user has a Role by its name or id.
     *
     * @param string $nameOrId Role name or id.
     * @return bool
     */
    public function hasRole($nameOrId)
    {
        foreach ($this->roles()->get() as $role) {

            //First check to see if it's an ID
            if (is_numeric($nameOrId)) {
                if ($role->id == $nameOrId) {
                    return true;
                }
            }

            //Otherwise check by name
            if ($role->name == $nameOrId) {

                return true;
            }
        }

        return false;
    }

}
