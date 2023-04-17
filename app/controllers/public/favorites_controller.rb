class Public::FavoritesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: @recipe.id)
    favorite.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
  end

  def index
    @favorites = Favorite.all
  end
end