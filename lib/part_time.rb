require "part_time/job"
require "part_time/queue"
require "part_time/version"

module PartTime
  def self.start
    @queue = Queue.new
    @running = true
  end

  def self.queue
    @queue
  end

  def self.running?
    @running
  end
end
