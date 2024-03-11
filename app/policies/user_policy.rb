# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  self.permitted_attributes = [
    roles: []
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
