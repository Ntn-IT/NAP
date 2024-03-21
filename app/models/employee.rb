# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :manager, class_name: 'Employee' # , foreign_key: :m1
  has_many :subordinates, class_name: 'Employee' # , foreign_key: :m1

  def mathr
    id
  end
end
