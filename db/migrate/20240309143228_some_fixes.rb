# frozen_string_literal: true

class SomeFixes < ActiveRecord::Migration[7.0]
  def change
    add_column :review_templates, :status, :string, null: true
    change_column_default :employees, :status, from: nil, to: :ouvrier
  end
end
