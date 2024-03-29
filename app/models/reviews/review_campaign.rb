# frozen_string_literal: true

module Reviews
  class ReviewCampaign < ApplicationRecord
    has_many :reviews, dependent: :delete_all

    has_many :review_campaign_templates, dependent: :delete_all
    has_many :review_templates, through: :review_campaign_templates
    accepts_nested_attributes_for :review_templates, allow_destroy: true
    validates_associated :review_templates

    enum status: { draft: 'draft', in_progress: 'in_progress', finished: 'finished' }

    validates :from_date, presence: true
    validates :to_date, presence: true
  end
end
