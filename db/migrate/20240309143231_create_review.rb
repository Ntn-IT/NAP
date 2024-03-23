# frozen_string_literal: true

class CreateReview < ActiveRecord::Migration[7.0]
  def change
    create_table(:reviews) do |t|
      t.string(:status, null: false, default: :in_progress)
      t.integer(:review_period_id, null: false)
      t.timestamp(:date, null: true)
      
      t.string(:employee_id, null: false)
      t.string(:employee_fname, null: false)
      t.string(:employee_lname, null: false)
      t.string(:employee_qualification, null: false)
      t.integer(:employee_seniority, null: false)

      t.string(:manager_id, null: false)
      t.string(:manager_fname, null: false)
      t.string(:manager_lname, null: false)
      t.string(:manager_qualification, null: false)

      t.json(:json_document, null: false)

      t.timestamps
    end

    add_index :reviews, [:review_period_id, :employee_id], unique: true
  end
end
