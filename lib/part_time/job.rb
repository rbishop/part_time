module PartTime
  module Job
    def self.included(klass)
      klass.class_eval do
        def self.new(*args)
          PartTime.queue.push({ job: self, args: args })
        end
      end
    end
  end
end
