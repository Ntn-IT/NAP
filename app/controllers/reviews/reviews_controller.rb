# frozen_string_literal: true

module Reviews 

  class ReviewsController < ApplicationController
    layout "print", only: %i[print]
    before_action :define_review, only: %i[show print edit update]

    def index_init_query
      Reviews::Review.all.joins(:employee, :manager).includes(:employee, :manager, :review_period)
    end
  
    def index_search_scopes
      {
        employee_names_mathrs: proc do |query, value| 
          query.where(
            "(employees.fname ILIKE :search OR employees.lname ILIKE :search OR employees.id ILIKE :search)", 
            search: "%#{ sanitize_sql_like(value) }%"
          ) 
        end,

        manager_names_mathrs: proc do |query, value| 
          query.where(
            "(managers_reviews.fname ILIKE :search OR managers_reviews.lname ILIKE :search OR managers_reviews.id ILIKE :search)", 
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
      authorize(@review)
    end

    def print
      authorize(@review)
    end
  
    def edit
      authorize(@review)
    end
  
    def update
      handle_update do
        authorize(@review)
  
        @review.update!(review_params)
        @review
      end
    end

    private
  
    def define_review
      @review = Reviews::Review.find(params[:id] || params[:review_id])
    end
  
    def review_params
      @employee_params ||= whitelisted_params(@review || Reviews::Review)
    end

  end

end