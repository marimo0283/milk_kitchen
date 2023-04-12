class Public::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all(recipe_params)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    render :edit
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :introduction, :serving, :recipe_image, :category_id,
    ingredient_attributes: [:id, :recipe_id, :ingredient_name, :amount, :_destroy])
  end

end
