# frozen_string_literal: true

module Reviews
  class CreateReviewsForCampaignService < Service
    def initialize(review_campaign:)
      @review_campaign = review_campaign
    end

    attr_reader :review_campaign

    def call
      Employee.all.each do |employee|
        review_template =  applicable_template_for_employee(employee)
        next unless review_template

        manager = employee.manager
        review = Reviews::Review.new(
          review_campaign:,
          review_template:,
          status: 'in_progress',
          date: nil,
          from_date: review_campaign.from_date,
          to_date: review_campaign.to_date,
          employee:,
          employee_fname: employee.fname,
          employee_lname: employee.lname,
          employee_qualification: employee.qualification,
          employee_seniority: 1,
          manager:,
          manager_fname: manager.fname,
          manager_lname: manager.lname,
          manager_qualification: manager.qualification,
          json_document: review_template.json_document
        )

        review.save(validate: false)
      rescue
        binding.pry 
        raise
      end
    end

    private

    def applicable_template_for_employee(employee)
      review_campaign.review_templates.find do |template|
        template.applicable_for_employee(employee)
      end
    end
  end
end
