class AddIndexToEmpid < ActiveRecord::Migration[7.0]
  def change
    add_index :empids, :emp_MatHR, unique: true 
  end
end
