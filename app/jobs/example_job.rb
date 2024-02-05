class HelloNameJob
  include Sidekiq::Job
 
  def perform(name, times)
    times.times do
      puts "Hello, #{name}!"
    end
  end
end