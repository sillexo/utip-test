<?php

namespace App\Http\Controllers\Api\V1;

use App\Article;
use App\Http\Resources\ArticleResource;
use App\Http\Resources\ArticlesResource;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;
use Validator;

class ArticleController extends APIController
{
    public function __construct()
    {
        $this->middleware('can:articles-manage');
    }

    /**
     * Display a listing of the resource.
     *
     * @return ArticlesResource
     */
    public function index(Request $request)
    {
        $limit = $request->get('paginate') ? $request->get('paginate') : 25;
        $orderBy = $request->get('orderBy') ? $request->get('orderBy') : 'ASC';
        $sortBy = $request->get('sortBy') ? $request->get('sortBy') : 'created_at';

        $articles = \Cache::remember('articles', 900, function() use ($request, $sortBy, $orderBy, $limit) {
            return Article::filter($request->get('filter'))->with(['author', 'comments.author'])->orderBy($sortBy, $orderBy)->paginate($limit);
        });

        return new ArticlesResource($articles);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Article $article
     *
     * @return ArticleResource
     */
    public function show(Article $article)
    {
        $articleCached = \Cache::remember('article_' . $article->id, 900, function() use ($article) {
            return Article::findOrFail($article->id);
        });

        ArticleResource::withoutWrapping();
        return new ArticleResource($articleCached);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validation = $this->validateArticle($request);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $article = Article::create($request->all());

        // Save image
        $this->imageStore($article);

        // return new ArticleResource($article);
        return response()->json($article, 201);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Article $article
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Article $article)
    {
        $validation = $this->validateArticle($request);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $article->update($request->all());

        // Save image
        $this->imageStore($article);

        return response()->json($article, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Article $article
     * @return \Illuminate\Http\Response
     */
    public function destroy(Article $article)
    {
        $article->delete();

        return response()->json([], 204);
    }

    /**
     * validateArticle Article Requests.
     *
     * @param $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function validateArticle(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'title'     => 'required|max:191',
            'author_id' => 'required|integer',
        ]);

        return $validation;
    }

    /**
     * validate message for validate Article.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function messages()
    {
        return [
            'name.required' => 'Please insert Article Title',
            'name.max'      => 'Article Title may not be greater than 191 characters.',
        ];
    }

    private function imageStore($article) {
        // Save image
        if (request()->has('image')) {
            $localPath = 'photos/'. basename(request()->image);

            $exists = Storage::disk('public')->exists($localPath);
            if ( ! $exists) {
                Storage::disk('public')->put($localPath, file_get_contents(request()->image));
            }

            $article->update([
                'image' => $localPath,
            ]);
        }
    }
}
