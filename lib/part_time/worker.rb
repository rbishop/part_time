module PartTime
  class Worker
    SHUTDOWN = "YOU'RE FIRED!"

    attr_reader :queue

    def initialize(queue)
      @queue = queue
      @working = true
    end

    def work
      Thread.new do
        loop do
          job, args = *queue.pop

          if job == SHUTDOWN && args.nil?
            @working = false
            break
          end

          job.new.perform(*args)
        end
      end
    end

    def working?
      @working
    end
  end
end
