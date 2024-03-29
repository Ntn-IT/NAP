# frozen_string_literal: true

module Reviews
  class CreateCampaignSynthesisService < Service

    AGGREGABLE_QUESTION_TYPES = []
    
    def initialize(review_campaign:)
      @review_campaign = review_campaign
    end

    attr_reader :review_campaign

    def call
      
    end

    private

  end
end
