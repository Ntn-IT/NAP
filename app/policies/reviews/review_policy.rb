# frozen_string_literal: true

module Reviews
  class ReviewPolicy < ApplicationPolicy
    self.permitted_attributes = %i[
      date
      from_date
      to_date
    ]

    def show?
      true
    end

    def print?
      resource.finished?
    end

    def index?
      true
    end

    def edit?
      resource.in_progress?
    end

    def update?
      resource.in_progress?
    end

    def finish?
      resource.in_progress?
    end
  end
end
