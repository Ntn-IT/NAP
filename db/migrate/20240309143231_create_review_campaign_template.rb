# frozen_string_literal: true

class CreateReviewCampaignTemplate < ActiveRecord::Migration[7.0]
  def change
    create_table(:review_campaign_templates) do |t|
      t.integer(:review_campaign_id, null: false)
      t.integer(:review_template_id, null: false)
    end

    add_index(
      :review_campaign_templates,
      %i[review_campaign_id review_template_id],
      unique: true,
      name: 'review_campaign_templates_unique_index'
    )
  end
end
