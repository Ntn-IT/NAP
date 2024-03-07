# frozen_string_literal: true

class AddUserRefToPersonnes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :personnes, column: :mathr
  end
end
