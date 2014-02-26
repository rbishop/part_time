require 'test_helper'
require 'support/dummy_job'

class WorkerTest < Minitest::Test
  def setup
    @worker = PartTime::Worker.new(Queue.new)
  end

  def test_works_on_jobs_in_queue
    DummyJob.any_instance.expects(:perform).with('test').once
    DummyJob.any_instance.expects(:perform).with('example').once

    @worker.queue.push([DummyJob, 'test'])
    @worker.queue.push([DummyJob, 'example'])

    Thread.pass
  end

  def test_stops_when_told_to_go_home
    @worker.queue.push "GO HOME!"
    @worker.clock_out

    assert_equal false, @worker.on_the_clock?
  end
end
