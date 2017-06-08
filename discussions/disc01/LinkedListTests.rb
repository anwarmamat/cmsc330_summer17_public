require "minitest/autorun"
require_relative "LinkedList.rb"

class LinkedListTests < Minitest::Test
  def setup
    @ll = LinkedList.new(1)
  end

  def test_list
    @ll.add(2)
    @ll.add(3)
    @ll.add(4)
    @ll.add(5)
    assert_equal("[1, 2, 3, 4, 5]", @ll.to_str)
  end
end
