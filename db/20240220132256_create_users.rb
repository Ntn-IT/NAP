# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.integer :last_name, null: false
      t.string :remember_token, null: false
      t.timestamps :remember_token_expires_at, null: false
      t.timestamps :created_at
      t.timestamps :updated_at
      t.integer :matsnr, foreign_key: true
      t.integer :mathr
    end
  end
end
