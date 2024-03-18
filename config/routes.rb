Rails.application.routes.draw do  
  get 'home', to: 'static_pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    root to: 'users/sessions#new'
    get 'sign_in', to: 'users/sessions#new'
    get '/users/sign_out', to: 'users/sessions#destroy'
  end
  resource :home, to: "home#show"
  resource :dashboard, to: "dashboard#show"

  resources :users, only: %i[show]
  resources :employees, only: %i[index show]

end