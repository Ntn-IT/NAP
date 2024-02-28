class Api < ApplicationRecord
  belongs_to :user  #, foreign_key:"emp_MatHR"
  belongs_to :empid
  paginates_per 650
end
