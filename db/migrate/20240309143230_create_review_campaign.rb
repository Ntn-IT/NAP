# frozen_string_literal: true

class CreateReviewCampaign < ActiveRecord::Migration[7.0]
  def change
    create_table(:review_campaigns) do |t|
      t.string(:title, null: false)
      t.datetime(:from_date, null: false)
      t.datetime(:to_date, null: false)
      t.string(:status, null: false, default: :draft)

      t.timestamps
    end
  end
end
