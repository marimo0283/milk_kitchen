class Public::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
    @steps = @recipe.steps.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all
    @categories = Category.all
    if params[:category_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @category = Category.find(params[:category_id])
      @recipes = @category.recipes
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @steps = @recipe.steps
    @comment = Comment.new
    @category = @recipe.category
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(current_user.id)
  end

  def favorite
    favorites = Favorite.where(user_id: current_user.id).pluck(:recipe_id)
    @favorite_list = Recipe.find(favorites)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :introduction, :serving, :recipe_image, :category_id,
    ingredients_attributes: [:id, :recipe_id, :ingredient_name, :amount, :_destroy],
    steps_attributes: [:id, :recipe_id, :step_introduction, :_destroy]
    )
  end

end
