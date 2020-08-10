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
    redirect "/recipes/#{@recipe.id}" if @recipe.save
    erb :'recipes/new'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :'recipes/show' if @recipe
    redirect '/recipes'
  end
end
