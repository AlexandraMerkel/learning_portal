require 'test_helper'

class CommunityContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_content = community_contents(:one)
  end

  test "should get index" do
    get community_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_community_content_url
    assert_response :success
  end

  test "should create community_content" do
    assert_difference('CommunityContent.count') do
      post community_contents_url, params: { community_content: { community_tab_id: @community_content.community_tab_id, content_body: @community_content.content_body, content_visibility: @community_content.content_visibility, creator_id: @community_content.creator_id, show: @community_content.show, view_type: @community_content.view_type } }
    end

    assert_redirected_to community_content_url(CommunityContent.last)
  end

  test "should show community_content" do
    get community_content_url(@community_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_content_url(@community_content)
    assert_response :success
  end

  test "should update community_content" do
    patch community_content_url(@community_content), params: { community_content: { community_tab_id: @community_content.community_tab_id, content_body: @community_content.content_body, content_visibility: @community_content.content_visibility, creator_id: @community_content.creator_id, show: @community_content.show, view_type: @community_content.view_type } }
    assert_redirected_to community_content_url(@community_content)
  end

  test "should destroy community_content" do
    assert_difference('CommunityContent.count', -1) do
      delete community_content_url(@community_content)
    end

    assert_redirected_to community_contents_url
  end
end
