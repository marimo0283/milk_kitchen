class ApplicationController < ActionController::Base

  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def create
    @recipe = Recipe.new(
    content: params[:content],
    user_id: @current_user.id
  )
  end


end
