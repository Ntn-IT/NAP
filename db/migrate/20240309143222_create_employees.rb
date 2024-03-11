# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table(:employees, id: false) do |t|
      t.string(:id, primary_key: true)
      t.integer(:siteid, null: false)
      t.string(:fname, null: false)
      t.string(:lname, null: false)
      t.string(:cname, null: false)
      t.integer(:matsnr, null: false)
      t.string(:department, null: false)
      t.string(:service, null: false)
      t.integer(:m1, null: false)
      t.string(:qualification, null: false)
      t.date(:bdate, null: false)
      t.string(:status, null: false)
      t.timestamps
    end
  end
end
