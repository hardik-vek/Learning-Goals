class TestDelayedJob

  def perform
    puts "hardik"
  end
  handle_asynchronously :perform
end