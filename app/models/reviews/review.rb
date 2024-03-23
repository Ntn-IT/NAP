# frozen_string_literal: true

module Reviews
  class Review < ApplicationRecord
    
    belongs_to :review_period
    belongs_to :manager, class_name: 'Employee', foreign_key: :manager_id
    belongs_to :employee, class_name: 'Employee', foreign_key: :employee_id

    enum status: { in_progress: "in_progress", finished: "finished" }

    def document
      @document ||= ReviewDocument.new(**json_document.deep_symbolize_keys)
    end
  end
end
