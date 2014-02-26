module PartTime
  module Job
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods
      def perform_async(*args)
        PartTime.queue.push([self, *args])
      end
    end
  end
end
