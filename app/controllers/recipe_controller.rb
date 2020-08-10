class RecipeController < ApplicationController
  get '/recipes' do
    erb :'recipes/index'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      erb :'recipes/new'
    end
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show' if @recipe
  end
end
