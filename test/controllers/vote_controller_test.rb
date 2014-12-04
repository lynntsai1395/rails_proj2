require 'test_helper'

class VoteControllerTest < ActionController::TestCase
  test "errors when casting vote with no user" do
    assert_raise NoMethodError do
      post :cast, entity: 'question-1', type: 'up'
    end
  end

  test "does nothing when given bad entity" do
    assert post :cast, entity: 'garbage', type: 'up'
  end

  test "doesn't try to add record (so no error) if not up/down" do
    assert post :cast, entity: 'garbage', type: 'delete'
  end

  test "doesn't render anything" do
    post :cast, entity: 'garbage', type: 'delete'
    assert response.body.length == 1 # newline
  end
end
