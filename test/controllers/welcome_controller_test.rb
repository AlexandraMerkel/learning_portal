require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get insufficient_privileges" do
    get welcome_insufficient_privileges_url
    assert_response :success
  end

end
