# frozen_string_literal: true

module Reviews
  class ReviewTemplate < ApplicationRecord
    def compiled_application_filter
      @compiled_application_filter ||= eval(application_filter)
    end

    def applicable_for_employee(employee)
      compiled_application_filter.call(employee)
    end

    def json_document_as_string
      JSON.pretty_generate(json_document)
    end

    def json_document_as_string=(json_document)
      self.json_document = JSON.parse(json_document)
    end
  end
end
