# frozen_string_literal: true

module Reviews
  class ReviewCampaignPolicy < ApplicationPolicy
    self.permitted_attributes = [
      :title, :from_date, :to_date, { review_template_ids: [] }
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
      resource.draft?
    end

    def update?
      resource.draft?
    end


    def finish?
      resource.in_progress?
    end

    def start?
      resource.draft?
    end

    def destroy?
      !resource.finished?
    end
  end
end
