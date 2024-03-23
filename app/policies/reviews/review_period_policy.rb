# frozen_string_literal: true

module Reviews 
  class ReviewPeriodPolicy < ApplicationPolicy
    
    self.permitted_attributes = [
      :title
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
  
    def finish?
      true
    end
  
  end
  
end