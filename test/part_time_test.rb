require 'test_helper'

class PartTimeTest < Minitest::Test
  def setup
    PartTime.start
  end

  def test_start_creates_an_empty_queue
    assert_equal 0, PartTime.queue.size
  end

  def test_start_creates_default_of_3_workers
    assert_equal 3, PartTime.workers.size
  end

  def test_that_its_running_after_start
    assert PartTime.running?
  end
end
