# frozen_string_literal: true

module Reviews
  class ReviewTemplatesController < ApplicationController
    before_action :define_review_template, only: %i[show edit update]

    def index_init_query
      Reviews::ReviewTemplate.all
    end

    def index_sort_scopes
      {
        created_at: ->(query, order) { query.order(created_at: order) }
      }
    end

    def show
      authorize(@review_template)
    end

    def new
      authorize(Reviews::ReviewTemplate)

      @review_template = Reviews::ReviewTemplate.new
    end

    def create
      handle_create(redirect_message: "Le modèle d'entretien a bien été créé") do
        authorize(Reviews::ReviewTemplate)

        @review_template = Reviews::ReviewTemplate.new(review_template_params)
        @review_template.save!

        @review_template
      end
    end

    def edit
      authorize(@review_template)
    end

    def update
      handle_update(redirect_message: "Le modèle d'entretien a bien été modifié") do
        authorize(@review_template)

        @review_template.update!(review_template_params)
        @review_template
      end
    end

    private

    def define_review_template
      @review_template = Reviews::ReviewTemplate.find(params[:id])
    end

    def review_template_params
      @employee_params ||= whitelisted_params(@review_template || Reviews::ReviewTemplate)
    end
  end
end
