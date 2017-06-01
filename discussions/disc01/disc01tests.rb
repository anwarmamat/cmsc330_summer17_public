require "minitest/autorun"
require_relative "disc01sol.rb"

class Tests < Minitest::Test
  def setup
    @ele = ElementaryFunctions.new()
    @lis = ListFunctions.new()
  end

  def test_sum_valid
    assert_equal(1, @ele.sum(1))
    assert_equal(15, @ele.sum(5))
    assert_equal(5050, @ele.sum(100))
  end

  def test_sum_invalid
    assert_raises(Exception) do
      @ele.sum(0)
    end
  end

  def test_is_prime
    assert_equal(true, @ele.is_prime?(2))
    assert_equal(true, @ele.is_prime?(3))
    assert_equal(false, @ele.is_prime?(4))
    assert_equal(true, @ele.is_prime?(5))
    assert_equal(true, @ele.is_prime?(179426003))
  end

  def test_largest_element
    assert_nil(@lis.largest([]))
    assert_equal(10, @lis.largest([1,2,10]))
    assert_equal(-5, @lis.largest([-5,-10,-15]))
  end

  def test_has
    assert_equal(true, @lis.has?([1,2,3],3))
    assert_equal(false, @lis.has?([1,2,3],4))
  end

end
