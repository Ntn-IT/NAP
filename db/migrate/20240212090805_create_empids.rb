class CreateEmpids < ActiveRecord::Migration[7.0]
  def change
    create_table :empids do |t|
      t.integer :emp_id
      t.text :emp_mat
      t.text :emp_mat_hr
      t.text :emp_fn
      t.text :emp_ln
      t.text :emp_cn
      t.text :emp_function
      t.text :emp_status
      t.text :emp_pole
      t.text :emp_service
      t.text :emp_grp
      t.integer :emp_pi_id
      t.integer :emp_m1
      t.integer :emp_m2
      t.integer :emp_m3
      t.integer :emp_m4
      t.integer :emp_m5

      t.timestamps
    end
  end
end
