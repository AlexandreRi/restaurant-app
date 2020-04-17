Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :restaurants do
    collection do
      get :top
    end
  end

  resources :restaurants do
    member do
      get :chef
    end
  end

  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, only: [ :destroy ]
end
