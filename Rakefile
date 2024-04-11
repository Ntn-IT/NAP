# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.


Rake::Task['db:load_config'].clear_prerequisites
require_relative 'config/application'

Rails.application.load_tasks
