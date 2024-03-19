# frozen_string_literal: true

class CreateReviewTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table(:review_templates) do |t|
      t.json(:template, null: false)
      t.string :title
      t.string :status, unique: true

      t.timestamps
    end
  end
end
