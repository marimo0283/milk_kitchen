Rails.application.routes.draw do
  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"

  # 会員用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_scope :user do
    post "/users/sign_out", to: "devise/sessions#destroy"
    post "/users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  scope module: :public do
    resources :recipes, only: [:new, :create, :update, :index, :show, :edit, :destroy] do
      collection do
        get "search"
        get "favorite"
      end
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :update, :edit, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :recipes, only: [:index, :show, :destroy]
  end
end
