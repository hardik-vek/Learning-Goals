class CallbackJob < ApplicationJob
  queue_as :default
  before_enqueue :before_setup
  after_enqueue :after_cleanup
  before_perform :setup
  after_perform :cleanup
  around_perform :mixup
  
  def perform(*args)
    puts "#{args}"
  end

  private

  def before_setup
    puts "before_setup"
  end

  def after_cleanup
    puts "after_cleanup"
  end

  def setup
    puts "setup"
  end

  def cleanup
    puts "cleanup"
  end

  def mixup
    puts "mixup-1"
    yield
    puts "mixup-2"
  end
  
end
