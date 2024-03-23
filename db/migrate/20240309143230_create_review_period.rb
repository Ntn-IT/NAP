# frozen_string_literal: true

class CreateReviewPeriod < ActiveRecord::Migration[7.0]
  def change
    create_table(:review_periods) do |t|
      t.string(:status, null: false, default: :in_progress)
      t.string(:title, null: false)

      t.timestamps
    end
  end
end
