require 'test_helper'

class QueueTest < Minitest::Test
  def setup
    @queue = PartTime::Queue.new
    @queue.push(1)
  end

  def test_push_adds_an_item
    assert_equal 1, @queue.size
  end

  def test_pop_retrieves_the_next_item
    assert_equal 1, @queue.pop
  end

  def test_size_returns_the_amount_of_items_queued
    assert_equal 1, @queue.size
  end
end
