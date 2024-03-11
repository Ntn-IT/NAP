# frozen_string_literal: true

class CreatePersonnes < ActiveRecord::Migration[7.0]
  def change
    create_table :personnes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :siteid, null: false
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :cname, null: false
      t.integer :matsnr, null: false
      t.integer :mathr, null: false
      t.string :department, null: false
      t.string :service, null: false
      t.integer :m1, null: false
      t.string :qualification, null: false
      t.date :bdate, null: false
      t.string :status, null: false
      t.timestamps
    end
  end
end
