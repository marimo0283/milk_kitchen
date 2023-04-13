class Public::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
    @steps = @recipe.steps.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all(recipe_params)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @steps = @recipe.steps
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
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :introduction, :serving, :recipe_image, :category_id,
    ingredients_attributes: [:id, :recipe_id, :ingredient_name, :amount, :_destroy],
    steps_attributes: [:id, :recipe_id, :step_introduction, :_destroy]
    )
  end

end
