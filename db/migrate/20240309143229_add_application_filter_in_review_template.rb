# frozen_string_literal: true

class AddApplicationFilterInReviewTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column(
      :review_templates,
      :application_filter,
      :string,
      null: false,
      default: '-> (employee) { true }' # FOnction ruby évaluée à la creation d'une review
    )

    remove_column :review_templates, :status, :string, null: false
  end
end
