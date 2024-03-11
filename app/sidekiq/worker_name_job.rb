# frozen_string_literal: true

class WorkerNameJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
