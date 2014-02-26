class PartTime::Worker
  def work
    loop do
      job, *args = @queue.pop

      if job == SHUTDOWN
        @on_the_clock = false and break
      elsif job
        job.new.perform(*args)
      end

      break if @queue.empty?
    end
  end
end

class Queue
  def self.new
    []
  end
end
