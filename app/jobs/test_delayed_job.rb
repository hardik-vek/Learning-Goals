class TestDelayedJob

  def perform
    puts "hello hardik"
  end
  handle_asynchronously :perform, :run_at => Proc.new { 50.seconds.from_now}
end