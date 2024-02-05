class ExampleJob < ApplicationJob
include NAP::
  queue_as :default

  def perform(*args)
    # Simulates a long, time-consuming task
    puts "I am #{name}, running my first job at #{age}"
    #any other valid Ruby/Rails code goes here!
  end

end