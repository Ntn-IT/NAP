# frozen_string_literal: true

module Reviews 
  class ReviewTemplatePolicy < ApplicationPolicy
    
    def index?
      true
    end
  
  end
  
end