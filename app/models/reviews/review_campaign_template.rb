# frozen_string_literal: true

module Reviews
  class ReviewCampaignTemplate < ApplicationRecord
    belongs_to :review_campaign
    belongs_to :review_template
  end
end
