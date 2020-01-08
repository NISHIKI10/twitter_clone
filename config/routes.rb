Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  # get 'comments/create'
  # get 'comments/destroy'
  # get 'favorites/create'
  # get 'favorites/destroy'
  devise_for :users

  root to:'tweets#index'
  
  resources :tweets
  resources :users

  resources :tweets do
    resources :favorites, only: [:create, :destroy]
  end

  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
end
