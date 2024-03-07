# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.text :app_name
      t.boolean :app_connect
      t.boolean :app_listing
      t.boolean :app_read
      t.boolean :apps_modify
      t.text :app_context

      t.timestamps
    end
  end
end
