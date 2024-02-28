class Empid < ApplicationRecord
    belongs_to :user  #, foreign_key:"emp_MatHR"
    belongs_to :apis
    paginates_per 50
end
