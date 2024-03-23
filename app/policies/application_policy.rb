# frozen_string_literal: true

class ApplicationPolicy
  class_attribute :permitted_attributes, default: []

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  attr_reader :user, :resource

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def permitted_attributes
    self.class.permitted_attributes
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
