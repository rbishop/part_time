require 'test_helper'

class PartTimeTest < Minitest::Test
  def test_start_creates_an_empty_queue
    PartTime.start

    assert_equal 0, PartTime.queue.size
  end

  def test_the_status_is_running
    PartTime.start

    assert PartTime.running?
  end
end
