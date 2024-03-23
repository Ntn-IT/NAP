# frozen_string_literal: true

module ApplicationHelper
  include Ntn::ViewHelper
  include Ntn::Admin::ViewHelper

  Contexts::EmployeeContext.define_context_method(self)
  Contexts::UserContext.define_context_method(self)
end
