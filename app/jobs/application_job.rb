class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Simulates a long, time-consuming task
    sleep 5
    # Will display current time, milliseconds included
    p "hello from ExampleJob #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end

end