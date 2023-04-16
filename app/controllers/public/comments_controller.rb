class Public::CommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    comment = current_user.comments.new(comment_params)
    comment.recipe_id = @recipe.id
    comment.save
    @comment = Comment.new
    @ingredients = @recipe.ingredients
    @steps = @recipe.steps
    
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

end
