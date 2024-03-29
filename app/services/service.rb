# frozen_string_literal: true

class Service
  def self.call(...)
    new(...).call_with_error_handler
  end

  def call_with_error_handler
    call
  # rescue StandardError => e
  #   BugNotifierService.call(e)

  #   raise
  end
end
