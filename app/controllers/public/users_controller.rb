class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
