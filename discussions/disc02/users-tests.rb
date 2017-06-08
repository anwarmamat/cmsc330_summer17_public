require "minitest/autorun"
require_relative "users-sol.rb"

class UsersTests < Minitest::Test

  def setup
    @usr = Users.new
  end

  def test_load
    assert_equal(true,@usr.load("users.txt"))
    assert_equal([5],@usr.corrupted)
    assert_equal(true,@usr.users.has_key?(1))
    assert_equal(true,@usr.users.has_key?(2))
    assert_equal(true,@usr.users.has_key?(3))
    assert_equal(true,@usr.users.has_key?(4))
  end

end
