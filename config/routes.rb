# frozen_string_literal: true

require_relative 'boot'
require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  resources :blogs
  resources :permissions
  resources :entretiens
  resources :personnes
  resources :siteids
  root to: 'home#/dashboard#index'
  namespace :admin do
  end
end
