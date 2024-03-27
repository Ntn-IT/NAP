require 'sidekiq/web'
require 'sidekiq/cron/web'

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
  mount Sidekiq::Web => '/sidekiq'
  resources :users, only: %i[index show edit update]
  resources :employees, only: %i[index show edit update]

  namespace :reviews do
    resources :reviews, only: %i[index show edit update] do 
      get :print, to: "reviews#print"
    end

    resources :review_templates, only: %i[index]
    resources :review_periods, only: %i[index show new create] do
      put :finish, to: "review_periods#finish"
    end
  end

end
