# frozen_string_literal: true

class AddEmailInEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :email, :string, null: true
  end
end
