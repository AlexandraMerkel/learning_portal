require 'test_helper'

class MessageUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_user = message_users(:one)
  end

  test "should get index" do
    get message_users_url
    assert_response :success
  end

  test "should get new" do
    get new_message_user_url
    assert_response :success
  end

  test "should create message_user" do
    assert_difference('MessageUser.count') do
      post message_users_url, params: { message_user: { message_id: @message_user.message_id, user_id: @message_user.user_id, viewing: @message_user.viewing } }
    end

    assert_redirected_to message_user_url(MessageUser.last)
  end

  test "should show message_user" do
    get message_user_url(@message_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_user_url(@message_user)
    assert_response :success
  end

  test "should update message_user" do
    patch message_user_url(@message_user), params: { message_user: { message_id: @message_user.message_id, user_id: @message_user.user_id, viewing: @message_user.viewing } }
    assert_redirected_to message_user_url(@message_user)
  end

  test "should destroy message_user" do
    assert_difference('MessageUser.count', -1) do
      delete message_user_url(@message_user)
    end

    assert_redirected_to message_users_url
  end
end
