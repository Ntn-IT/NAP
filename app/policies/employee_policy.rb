# frozen_string_literal: true

class EmployeePolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end
end
