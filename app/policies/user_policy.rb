# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  self.permitted_attributes = [
    roles: []
  ]

  def show?
    user.admin?
  end

  def index?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end
end
