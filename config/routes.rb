require_relative "boot"
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  resources :empids
  resources :ntnsiteids
end
