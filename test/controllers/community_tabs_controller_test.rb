require 'test_helper'

class CommunityTabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_tab = community_tabs(:one)
  end

  test "should get index" do
    get community_tabs_url
    assert_response :success
  end

  test "should get new" do
    get new_community_tab_url
    assert_response :success
  end

  test "should create community_tab" do
    assert_difference('CommunityTab.count') do
      post community_tabs_url, params: { community_tab: { community_section_id: @community_tab.community_section_id, tab_name: @community_tab.tab_name, tab_position: @community_tab.tab_position } }
    end

    assert_redirected_to community_tab_url(CommunityTab.last)
  end

  test "should show community_tab" do
    get community_tab_url(@community_tab)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_tab_url(@community_tab)
    assert_response :success
  end

  test "should update community_tab" do
    patch community_tab_url(@community_tab), params: { community_tab: { community_section_id: @community_tab.community_section_id, tab_name: @community_tab.tab_name, tab_position: @community_tab.tab_position } }
    assert_redirected_to community_tab_url(@community_tab)
  end

  test "should destroy community_tab" do
    assert_difference('CommunityTab.count', -1) do
      delete community_tab_url(@community_tab)
    end

    assert_redirected_to community_tabs_url
  end
end
