class DummyJob
  def self.perform_async(*args)
    PartTime.queue.push(args)
    new.perform(*args)
  end

  def perform(*args)
    args
  end
end
