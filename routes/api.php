<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['namespace' => 'Api\V1'], function () {

    Route::post('login', 'AuthController@login');
    Route::post('register', 'AuthController@register');

    Route::group(['middleware' => ['jwt.verify'], 'as' => 'api.'], function() {

        Route::post('logout', 'AuthController@logout');
        Route::post('refresh', 'AuthController@refresh');

        Route::apiResource('articles', ArticleController::class, ['except' => ['create', 'edit']]);
        Route::apiResource('comments', CommentController::class, ['except' => ['create', 'edit']]);
        Route::apiResource('roles', RolesController::class, ['except' => ['create', 'edit']]);
        Route::apiResource('users', UsersController::class, ['except' => ['create', 'edit']]);

        Route::get(
            'articles/{article}/relationships/author',
            [
                'uses' => ArticleRelationshipController::class . '@author',
                'as' => 'articles.relationships.author',
            ]
        );
        Route::get(
            'articles/{article}/author',
            [
                'uses' => ArticleRelationshipController::class . '@author',
                'as' => 'articles.author',
            ]
        );
        Route::get(
            'articles/{article}/relationships/comments',
            [
                'uses' => ArticleRelationshipController::class . '@comments',
                'as' => 'articles.relationships.comments',
            ]
        );
        Route::get(
            'articles/{article}/comments',
            [
                'uses' => ArticleRelationshipController::class . '@comments',
                'as' => 'articles.comments',
            ]
        );

    });
});
