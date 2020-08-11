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
    redirect '/recipes' unless @recipe
    erb :'recipes/show'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    redirect '/recipes' unless @recipe
    erb :'recipes/edit'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    redirect '/recipes' unless @recipe
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    redirect "/recipes/#{@recipe.id}" if @recipe.save
    redirect '/recipes'
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete if @recipe
    redirect '/recipes'
  end

end
