# frozen_string_literal: true

class Service

  def self.call(...)
    self.new(...).call_with_error_handelr
  end

  def call_with_error_handelr
    begin 
      call
    rescue StandardError => e
      BugNotifierService.call(e)

      raise
    end
  end
end
