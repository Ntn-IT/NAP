# frozen_string_literal: true

class AddEmployeeIdToUsers < ActiveRecord::Migration[7.0]

  def change
    change_table(:users) do |t|
      t.string(:employee_id, null: false)
    end

    add_index(:users, %i[employee_id], name: "index_users_on_employee_id")
  end

end
