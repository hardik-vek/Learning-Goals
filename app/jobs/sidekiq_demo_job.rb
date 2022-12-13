class SidekiqDemoJob
  include Sidekiq::Job

  def perform(*args)
    puts "Hello Hardik"
  end
end  