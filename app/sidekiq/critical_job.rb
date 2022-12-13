class CriticalJob
  include Sidekiq::Job
  sidekiq_options queue: 'critical'

  def perform(*args)
    puts "Doing critical work"
  end
end
