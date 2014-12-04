require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user requires a password" do
    assert_not User.create(email: 'foo@example.com').id
  end

  test "user requires a long password" do
    assert_not User.create(email: 'foo@example.com', password: 'hunter2').id
  end

  test "user requires a valid email" do
    assert_not User.create(email: 'foo', password: 'hunter2~').id
  end

  test "user email must be unique" do
    assert User.create(email: 'user1@example.com', password: 'hunter2~').id
    assert_not User.create(email: 'user1@example.com', password: 'hunter2~').id
  end
end
