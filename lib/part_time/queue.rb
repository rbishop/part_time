module PartTime
  class Queue
    def initialize
      @queue = ::Queue.new
    end

    def push(job)
      @queue.push(job)
    end

    def pop
      @queue.pop
    end

    def size
      @queue.size
    end
  end
end
