# frozen_string_literal: true

class SomeFixes < ActiveRecord::Migration[7.0]
  def change
    add_column :review_templates, :status, :string, null: false
    add_column :review_templates, :title, :string, null: false
    add_column :review_templates, :json_document, :json, null: false
    
    remove_column :review_templates, :template, :json, null: false
    change_column_default :employees, :status, from: nil, to: :ouvrier
  end
end
