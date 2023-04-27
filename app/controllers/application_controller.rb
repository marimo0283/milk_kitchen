class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result

    @search_user = User.ransack(params[:q])
    @users = @search_user.result
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
