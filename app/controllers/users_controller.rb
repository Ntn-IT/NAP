# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :define_user, only: %i[show edit update destroy]

  def index_init_query
    User.joins(:employee).includes(:employee)
  end

  def index_search_scopes
    {
      names_mathrs: proc do |query, value| 
        query.where(
          "(employees.fname ILIKE :search OR employees.lname ILIKE :search OR employees.id ILIKE :search)", 
          search: "%#{ sanitize_sql_like(value) }%"
        ) 
      end,
    }
  end

  def index_sort_scopes
    {
      created_at: ->(query, order) { query.order(created_at: order) }
    }
  end

  def show
    authorize(current_user)
  end

  def edit
    authorize(@user)
  end

  def update
    handle_update do
      authorize(@user)

      @user.update!(user_params)
      @user
    end
  end

  def destroy
    handle_destroy do
      authorize(@user)

      @user.destroy!
    end
  end

  private

  def define_user
    @user = User.find(params[:id])
  end

  def user_params
    @user_params ||= whitelisted_params(@user || User)
  end
end
