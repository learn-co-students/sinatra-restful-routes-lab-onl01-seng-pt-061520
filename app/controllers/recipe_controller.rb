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
    if @recipe
      erb :'recipes/show'
    else
      redirect '/recipes'
    end
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe
      erb :'recipes/edit'
    else
      redirect '/recipes'
    end
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
    redirect '/recipes'
  end

end
