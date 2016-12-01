require 'test_helper'

class CommunityUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_user = community_users(:one)
  end

  test "should get index" do
    get community_users_url
    assert_response :success
  end

  test "should get new" do
    get new_community_user_url
    assert_response :success
  end

  test "should create community_user" do
    assert_difference('CommunityUser.count') do
      post community_users_url, params: { community_user: { community_id: @community_user.community_id, link_type: @community_user.link_type, user_id: @community_user.user_id } }
    end

    assert_redirected_to community_user_url(CommunityUser.last)
  end

  test "should show community_user" do
    get community_user_url(@community_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_user_url(@community_user)
    assert_response :success
  end

  test "should update community_user" do
    patch community_user_url(@community_user), params: { community_user: { community_id: @community_user.community_id, link_type: @community_user.link_type, user_id: @community_user.user_id } }
    assert_redirected_to community_user_url(@community_user)
  end

  test "should destroy community_user" do
    assert_difference('CommunityUser.count', -1) do
      delete community_user_url(@community_user)
    end

    assert_redirected_to community_users_url
  end
end
