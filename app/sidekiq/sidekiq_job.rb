class SidekiqJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    puts "hello hardik #{args}"
  end
end
