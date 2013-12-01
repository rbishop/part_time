require 'test_helper'

class WorkerTest < Minitest::Test
  def setup
    @worker = PartTime::Worker.new(PartTime::Queue.new)
    @worker.work
  end

  def test_worker_stops_when_its_fired
    @worker.queue.push "YOU'RE FIRED!"

    assert_equal false, @worker.working?
  end
end
