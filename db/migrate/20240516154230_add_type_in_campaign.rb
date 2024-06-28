# frozen_string_literal: true

class AddTypeInCampaign < ActiveRecord::Migration[7.0]
  def change
    change_table(:review_campaigns) do |t|
      t.string(:kind, null: true)
    end

    Reviews::ReviewCampaign.all.each do |review_campaign|
      review_campaign.kind = 'yearly'
      review_campaign.save  
    end

   
    change_column_null(:review_campaigns, :kind, false)
  end
end

# rails -e production db:migrate
# RAILS_ENV="production" rails db:migrate