# frozen_string_literal: true

module Reviews
  class ReviewsController < ApplicationController
    layout 'print', only: %i[print]
    before_action :define_review, only: %i[show print edit update finish]



    def index_init_query
      query = Reviews::Review.all.joins(:employee, :manager, :review_campaign).includes(:employee, :manager, :review_campaign)
      query = query.where(review_campaigns: { status: "in_progress"} ) 
      query = query.where(manager: current_user.employee ) unless current_user.rh?

      query
      

    end

    def index_search_scopes
      {
        employee_names_mathrs: proc do |query, value|
          query.where(
            '(employees.fname ILIKE :search OR employees.lname ILIKE :search OR employees.id ILIKE :search)',
            search: "%#{sanitize_sql_like(value)}%"
          )
        end,

        manager_names_mathrs: proc do |query, value|
          query.where(
            '(managers_reviews.fname ILIKE :search OR managers_reviews.lname ILIKE :search OR managers_reviews.id ILIKE :search)',
            search: "%#{sanitize_sql_like(value)}%"
          )
        end
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
      handle_update(redirect_message: "L'entretien a bien été modifié") do
        authorize(@review)

        review_anwsers = params.require(:review).permit!

        @review.document.merge_answers(review_anwsers['categories'].as_json)
        @review.json_document = @review.document.as_json
        @review.save!(validate: false)
        
        @review.update!(review_params)

        @review
      end
    end

    def finish
      handle_record_operation(redirect_message: "L'entretien a bien été cloturée") do
        authorize(@review)

        @review.status = 'finished'
        @review.save(validate: false)

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
