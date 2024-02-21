class AddUserToApis < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :apis, :users, column: :api_mat
  end
end
