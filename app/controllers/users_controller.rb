# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    authorize(current_user)
  end

end
