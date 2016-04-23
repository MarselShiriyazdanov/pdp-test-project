Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :articles, except: :destroy do
    resources :comments, only: :create
  end
end
