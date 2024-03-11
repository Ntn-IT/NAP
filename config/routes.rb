# frozen_string_literal: true

Rails.application.routes.draw do
  root "dashboard#show"

  devise_for :users,
    controllers: {
      registrations: "registrations",
      sessions: "sessions",
    }

  resource :home, to: "home#show"
  resource :dashboard, to: "dashboard#show"

  resources :users, only: %i[show]
  resources :employees, only: %i[index show]
end
