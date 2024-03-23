# frozen_string_literal: true

class ReviewsController < ApplicationController
  def show
    authorize(self)
  end
  def template
    authorize(self)
  end
  def session
    authorize(self)
  end
end
