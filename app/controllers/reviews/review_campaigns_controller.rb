# frozen_string_literal: true

module Reviews
  class ReviewCampaignsController < ApplicationController
    before_action :define_review_campaign, only: %i[show edit update start finish destroy]

    def index_init_query
      Reviews::ReviewCampaign.all
    end

    def index_sort_scopes
      {
        created_at: ->(query, order) { query.order(created_at: order) }
      }
    end

    def show
      authorize(@review_campaign)
    end

    def new
      authorize(Reviews::ReviewCampaign)

      @review_campaign = Reviews::ReviewCampaign.new
    end

    def create
      handle_create do
        authorize(Reviews::ReviewCampaign)

        @review_campaign = Reviews::ReviewCampaign.new(review_campaign_params)
        @review_campaign.save!

        @review_campaign
      end
    end

    def edit
      authorize(@review_campaign)
    end

    def update
      handle_update(redirect_message: "La campagne d'entretien a bien été modifié") do
        authorize(@review_campaign)

        @review_campaign.update!(review_campaign_params)

        @review_campaign
      end
    end

    def start
      handle_record_operation(redirect_message: "La campagne d'entretien a bien été lancée") do
        authorize(@review_campaign)

        @review_campaign.update!(status: 'in_progress')
        Reviews::CreateReviewsForCampaignService.call(review_campaign: @review_campaign)

        @review_campaign
      end
    end

    def finish
      handle_record_operation(redirect_message: "La campagne d'entretien a bien été cloturé") do
        authorize(@review_campaign)

        @review_campaign.update!(status: 'finished')
        @review_campaign
      end
    end

    def destroy
      handle_destroy(redirect_message: "La campagne d'entretien a bien été supprimée") do
        authorize(@review_campaign)

        @review_campaign.destroy!
      end
    end

    private

    def define_review_campaign
      @review_campaign = Reviews::ReviewCampaign.find(params[:id] || params[:review_campaign_id])
    end

    def review_campaign_params
      @review_campaign_params ||= whitelisted_params(@review_campaign || Reviews::ReviewCampaign)
    end
  end
end
