require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "success user save without name/email" do
    user = User.new
    user.name = "Hello User"
    user.email = "hellouser@gmail.com"
    assert user.save, "Saved user with name/email"
  end

  test "fail user save without name" do
    user = User.new
    user.email = "hellouser@gmail.com"
    assert_not user.save, "Failed user save without name"
  end

  test "fail user save without email" do
    user = User.new
    user.name = "Hello User"
    assert_not user.save, "Failed user save without email"
  end

  test "fail user save without name/email" do
    user = User.new
    assert_not user.save, "Failed user save without name/email"
  end

  test "user count test from user fixture" do
    assert_equal 2, User.count, "User fixture should be 2"
  end

  test "user object test from user fixture" do
    assert_not_nil User.all, "User.all should be not nil object"
  end

  test "find user by primary key ID" do
    assert_not_nil User.find(1), "Find user by primary key ID 1"
  end

  test "show user name with find" do
    assert_equal "Mister Oke", User.find(1).name, "Should be equal Mister Oke"
  end
end
