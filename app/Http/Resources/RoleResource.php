<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class RoleResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request
     *
     * @return array
     */
    public function toArray($request)
    {
        return [
            'type'       => 'roles',
            'id'         => $this->id,
            'attributes' => [
                'name'         => $this->name,
                'display_name' => $this->display_name,
            ],
            'links'      => [
                'self' => route('api.roles.show', ['role' => $this->id]),
            ],
        ];
    }
}
