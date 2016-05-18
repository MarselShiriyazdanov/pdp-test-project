Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  resources :articles, except: :destroy do
    resources :comments, only: :create
  end

  resource :feedback, only: %i(new create)
  get "/about_us", to: 'pages#about_us'

  mount Attachinary::Engine => "/attachinary"
end
