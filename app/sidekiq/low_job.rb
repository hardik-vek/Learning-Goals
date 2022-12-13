class LowJob
  include Sidekiq::Job
  sidekiq_options queue: 'low'

  def perform(*args)
    puts "Doing low work"
  end
end
