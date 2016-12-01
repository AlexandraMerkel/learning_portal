require 'test_helper'

class MessageListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_list = message_lists(:one)
  end

  test "should get index" do
    get message_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_message_list_url
    assert_response :success
  end

  test "should create message_list" do
    assert_difference('MessageList.count') do
      post message_lists_url, params: { message_list: { header: @message_list.header } }
    end

    assert_redirected_to message_list_url(MessageList.last)
  end

  test "should show message_list" do
    get message_list_url(@message_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_list_url(@message_list)
    assert_response :success
  end

  test "should update message_list" do
    patch message_list_url(@message_list), params: { message_list: { header: @message_list.header } }
    assert_redirected_to message_list_url(@message_list)
  end

  test "should destroy message_list" do
    assert_difference('MessageList.count', -1) do
      delete message_list_url(@message_list)
    end

    assert_redirected_to message_lists_url
  end
end
