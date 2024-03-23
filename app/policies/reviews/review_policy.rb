# frozen_string_literal: true

module Reviews 
  class ReviewPolicy < ApplicationPolicy
    
    self.permitted_attributes = [
      #:email
    ]
  
    def show?
      true
    end

    def print?
      true
    end
  
    def index?
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