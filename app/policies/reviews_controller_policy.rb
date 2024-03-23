# frozen_string_literal: true

class ReviewsControllerPolicy < ApplicationPolicy
  def show?
    true
  end
  def template?
    true
  end
  def session?
    true
  end
end
