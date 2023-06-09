class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:edit]

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
      flash[:notice] = "プロフィールを編集しました！"
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会しました。ご利用ありがとうございました！"
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to recipes_path
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@com"
      flash[:notice] = "ゲストユーザーはプロフィール編集画面へ遷移できません。"
      redirect_to user_path(current_user)
    end
  end
end
