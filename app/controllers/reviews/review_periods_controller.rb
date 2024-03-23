# frozen_string_literal: true

module Reviews 

  class ReviewPeriodsController < ApplicationController
    before_action :define_review_period, only: %i[show finish]
  
    def index_init_query
      Reviews::ReviewPeriod.all
    end
  
    def index_sort_scopes
      {
        created_at: ->(query, order) { query.order(created_at: order) }
      }
    end

    def show
      authorize(@review_period)
    end
  
    def new
      authorize(Reviews::ReviewPeriod)

      @review_period = Reviews::ReviewPeriod.new
    end
  
    def create
      handle_create do
        authorize(Reviews::ReviewPeriod)

        @review_period = Reviews::ReviewPeriod.new(review_period_params)
        @review_period.save!

        Reviews::CreateReviewsOfPeriodService.call(review_period: @review_period)

        @review_period
      end
    end

    def finish
      handle_record_operation do
        authorize(@review_period)

        @review_period.update!(status: "finished")
        @review_period
      end
    end
  
    private
  
    def define_review_period
      @review_period = Reviews::ReviewPeriod.find(params[:id] || params[:review_period_id])
    end
  
    def review_period_params
      @review_period_params ||= whitelisted_params(@review_period || Reviews::ReviewPeriod)
    end
  end
  
end