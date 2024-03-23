# frozen_string_literal: true

module ApplicationHelper
  include Ntn::ViewHelper
  include Ntn::Admin::ViewHelper
  include ComponentsHelper

  EmployeeContext.define_context_method(self)
  UserContext.define_context_method(self)
  ReviewsContext.define_context_method(self)
end
