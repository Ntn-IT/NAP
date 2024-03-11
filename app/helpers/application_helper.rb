# frozen_string_literal: true

module ApplicationHelper

  include Ntn::ViewHelper
  include Ntn::Admin::ViewHelper

  Contexts::EmployeeContext.define_method_context(self)

end
