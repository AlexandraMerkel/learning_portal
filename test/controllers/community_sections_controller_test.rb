require 'test_helper'

class CommunitySectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_section = community_sections(:one)
  end

  test "should get index" do
    get community_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_community_section_url
    assert_response :success
  end

  test "should create community_section" do
    assert_difference('CommunitySection.count') do
      post community_sections_url, params: { community_section: { community_id: @community_section.community_id, section_name: @community_section.section_name, section_position: @community_section.section_position, section_type: @community_section.section_type } }
    end

    assert_redirected_to community_section_url(CommunitySection.last)
  end

  test "should show community_section" do
    get community_section_url(@community_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_section_url(@community_section)
    assert_response :success
  end

  test "should update community_section" do
    patch community_section_url(@community_section), params: { community_section: { community_id: @community_section.community_id, section_name: @community_section.section_name, section_position: @community_section.section_position, section_type: @community_section.section_type } }
    assert_redirected_to community_section_url(@community_section)
  end

  test "should destroy community_section" do
    assert_difference('CommunitySection.count', -1) do
      delete community_section_url(@community_section)
    end

    assert_redirected_to community_sections_url
  end
end
