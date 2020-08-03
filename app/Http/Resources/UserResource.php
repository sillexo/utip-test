<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class UserResource extends Resource
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
            'type'       => 'users',
            'id'         => $this->id,
            'attributes' => [
                'name' => $this->name,
            ],
            'links'      => [
                'self' => route('api.users.show', ['user' => $this->id]),
            ],
        ];
    }

    public function with($request)
    {
        $hasProfile = $request->profile ? $request->profile : false;

        if ($hasProfile) {
            return [
                'included' => new ProfileRelationshipResource($this->profile)
            ];
        }
        return [];
    }
}
