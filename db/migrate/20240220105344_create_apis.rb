class CreateApis < ActiveRecord::Migration[7.0]
  def change
    create_table :apis do |t|
      t.integer :api_mat
      t.integer :api_M1
      t.text :api_Obj1
      t.text :api_Obj2
      t.text :api_Obj3
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
