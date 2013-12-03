module PartTime
  module Job
    def self.included(klass)
      klass.class_eval do
        def self.perform_async(*args)
          PartTime.queue.push([self, *args])
        end
      end
    end
  end
end
