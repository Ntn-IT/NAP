# frozen_string_literal: true

class ApplicationPolicy
  class_attribute :permitted_attributes, default: []

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  attr_reader :user, :resource

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def method_missing(name, *args)
    return true
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
