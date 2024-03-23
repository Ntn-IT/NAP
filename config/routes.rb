Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  devise_scope :user do
    root to: 'sessions#new'
    get 'sign_in', to: 'sessions#new'
    get 'sign_out', to: 'sessions#destroy'
  end

  resource :dashboard, to: 'dashboard#show'
  resource :reviews, to: 'reviews#show'
  resource :template, to: 'reviews#template'
  resource :session, to: 'reviews#session'
  
  resources :users, only: %i[index show edit update]
  resources :employees, only: %i[index show edit update]
end
