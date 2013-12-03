module PartTime
  class Worker
    SHUTDOWN = "GO HOME!"

    attr_accessor :queue

    def initialize(queue)
      @queue = queue
      @on_the_clock = true

      work
    end

    def work
      @thread ||= Thread.new do
        loop do
          job, *args = queue.pop
          break if job == SHUTDOWN
          job.new.perform(*args)
        end

        @on_the_clock = false
      end
    end

    def join
      @thread.join
    end

    def on_the_clock?
      @on_the_clock
    end
  end
end
