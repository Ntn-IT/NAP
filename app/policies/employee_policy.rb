# frozen_string_literal: true

class EmployeePolicy < ApplicationPolicy
  self.permitted_attributes = [
    :email
  ]

  def show?
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
