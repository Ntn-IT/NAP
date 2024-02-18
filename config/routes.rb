require_relative "boot"
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  resources :apis
  resources :empids
  resources :siteids
  root to: 'home#index'
  namespace :admin do
    end
end
