require 'test_helper'
require 'support/dummy_job'

class JobTest < Minitest::Test
  def setup
    PartTime.start(size: 1)
  end

  def test_adding_the_job_to_the_queue
    DummyJob.perform_async

    assert_equal 1, PartTime.queue.size
  end

  def test_job_gets_picked_up_and_ran
    DummyJob.any_instance.expects(:perform).with('test')
    DummyJob.perform_async('test')
    Thread.pass
  end
end
