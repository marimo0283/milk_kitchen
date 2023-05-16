class Public::CommentsController < ApplicationController
  before_action :is_matching_comment_user, only: [:destroy]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    comment = current_user.comments.new(comment_params)
    comment.recipe_id = @recipe.id
    comment.save
    @comment = Comment.new
    @ingredients = @recipe.ingredients
    @steps = @recipe.steps
    @category = @recipe.category

    render "public/recipes/show"
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    Comment.find(params[:id]).destroy
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def is_matching_comment_user
    @comment = Comment.find(params[:id])
    user = @comment.user
    unless user.id == current_user.id
      redirect_to recipes_path
    end
  end

end
