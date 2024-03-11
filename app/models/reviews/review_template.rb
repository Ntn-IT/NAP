# frozen_string_literal: true

module Reviews
  class ReviewTemplate < ApplicationRecord
    
    enum status: Employee.statuses


    # def template
    #   template = super.map { Category.new(**_1.deep_symbolize_keys) }
    # end
  end
end
