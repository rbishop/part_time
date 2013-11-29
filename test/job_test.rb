require 'test_helper'

class DummyJob
  include ::PartTime::Job
end

class JobTest < Minitest::Test
  def setup
    PartTime.start
  end

  def test_the_job_gets_added_to_the_queue
    job = DummyJob.new
    assert_equal 1, PartTime.queue.size
  end
end
