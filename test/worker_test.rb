require 'test_helper'
require 'support/dummy_job'
require 'support/testing'

class WorkerTest < Minitest::Test
  def setup
    @worker = PartTime::Worker.new([])
  end

  def test_works_on_jobs_in_queue
    DummyJob.any_instance.expects(:perform).with('test').once
    DummyJob.any_instance.expects(:perform).with('example').once

    @worker.queue.push([DummyJob, 'test'])
    @worker.queue.push([DummyJob, 'example'])
    @worker.work
  end

  def test_stops_when_told_to_go_home
    @worker.queue.push "GO HOME!"
    @worker.work

    assert_equal false, @worker.on_the_clock?
  end
end
