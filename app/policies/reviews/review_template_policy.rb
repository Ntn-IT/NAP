# frozen_string_literal: true

module Reviews
  class ReviewTemplatePolicy < ApplicationPolicy
    self.permitted_attributes = %i[
      title application_filter json_document_as_string
    ]

    def show?
      true
    end

    def index?
      true
    end

    def new?
      true
    end

    def create?
      true
    end

    def edit?
      true
    end

    def update?
      true
    end
  end
end
