class ImportPersonnelJob
  include Sidekiq::Job

  def perform(*args)
    puts "hello moto!!!!!!!!"
  end
end
