class CreateEmpids < ActiveRecord::Migration[7.0]
  def change
    create_table :empids do |t|
      t.integer :emp_ID
      t.integer :emp_SITEID
      t.text :emp_FName
      t.text :emp_LName
      t.text :emp_CName
      t.text :emp_Mat
      t.integer :emp_MatHR
      t.text :emp_Department
      t.text :emp_Service
      t.text :emp_M1
      t.integer :emp_PI_ID

      t.timestamps
    end
  end
end
