# frozen_string_literal: true

class SessionsController < Devise::SessionsController

  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

end
