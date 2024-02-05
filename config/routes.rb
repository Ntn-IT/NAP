require_relative "boot"
require "rails"
require "active_model/railtie"
require "active_job/railtie"

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
