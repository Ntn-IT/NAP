# frozen_string_literal: true

module Reviews
  class CreateReviewsOfPeriodService < Service
    
    def initialize(review_period:)
      @review_period = review_period
    end

    attr_reader :review_period
    
    def call
      Employee.all.each do |employee|
        manager = employee.manager
        Reviews::Review.create(
          review_period:,
          status: "in_progress", 
          employee:, 
          employee_fname: employee.fname,
          employee_lname: employee.lname,
          employee_qualification: employee.qualification,
          employee_seniority: 1, 
          manager:,
          manager_fname: manager.fname,
          manager_lname: manager.lname,
          manager_qualification: manager.qualification,
          json_document: json_document_for_employe(employee)
        )
      end
    end

    private

    def json_document_for_employe(employee)
      employee.ouvrier? ? ouvrier_json_document : cadre_json_document
    end

    def ouvrier_json_document
      @ouvrier_json_document ||= Reviews::ReviewTemplate.find_by(status: :ouvrier).json_document
    end

    def cadre_json_document
      @cadre_json_document ||= Reviews::ReviewTemplate.find_by(status: :cadre).json_document
    end
  end
end


