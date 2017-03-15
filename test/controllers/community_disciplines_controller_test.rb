require 'test_helper'

class CommunityDisciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_discipline = community_disciplines(:one)
  end

  test "should get index" do
    get community_disciplines_url
    assert_response :success
  end

  test "should get new" do
    get new_community_discipline_url
    assert_response :success
  end

  test "should create community_discipline" do
    assert_difference('CommunityDiscipline.count') do
      post community_disciplines_url, params: { community_discipline: { community_id: @community_discipline.community_id, discipline_id: @community_discipline.discipline_id } }
    end

    assert_redirected_to community_discipline_url(CommunityDiscipline.last)
  end

  test "should show community_discipline" do
    get community_discipline_url(@community_discipline)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_discipline_url(@community_discipline)
    assert_response :success
  end

  test "should update community_discipline" do
    patch community_discipline_url(@community_discipline), params: { community_discipline: { community_id: @community_discipline.community_id, discipline_id: @community_discipline.discipline_id } }
    assert_redirected_to community_discipline_url(@community_discipline)
  end

  test "should destroy community_discipline" do
    assert_difference('CommunityDiscipline.count', -1) do
      delete community_discipline_url(@community_discipline)
    end

    assert_redirected_to community_disciplines_url
  end
end
