require "part_time/job"
require "part_time/worker"
require "part_time/version"

module PartTime
  extend self

  NUM_WORKERS = 3

  def start(config = {})
    @queue = Queue.new
    @workers = (config[:size] || NUM_WORKERS).times.map { Worker.new(queue) }
    @running = true
  end

  def queue
    @queue
  end

  def workers
    @workers
  end

  def running?
    @running
  end
end
