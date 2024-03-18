# frozen_string_literal: true

class HomeController < ApplicationController

  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized



  layout "devise"

  def show; end

end
