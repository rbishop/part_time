require 'test_helper'
require 'support/dummy_job'

class WorkerTest < Minitest::Test
  def setup
    @worker = PartTime::Worker.new(Queue.new)
    @worker.work
  end

  def test_worker_stops_when_its_fired
    @worker.queue.push "YOU'RE FIRED!"
    @worker.join

    assert_equal false, @worker.working?
  end

  def test_worker_calls_perform_on_job

  end
end
