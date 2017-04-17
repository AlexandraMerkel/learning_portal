require 'test_helper'

class CommunityNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_news = community_news(:one)
  end

  test "should get index" do
    get community_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_community_news_url
    assert_response :success
  end

  test "should create community_news" do
    assert_difference('CommunityNews.count') do
      post community_news_index_url, params: { community_news: { community_id: @community_news.community_id, news_body: @community_news.news_body, user_id: @community_news.user_id } }
    end

    assert_redirected_to community_news_url(CommunityNews.last)
  end

  test "should show community_news" do
    get community_news_url(@community_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_news_url(@community_news)
    assert_response :success
  end

  test "should update community_news" do
    patch community_news_url(@community_news), params: { community_news: { community_id: @community_news.community_id, news_body: @community_news.news_body, user_id: @community_news.user_id } }
    assert_redirected_to community_news_url(@community_news)
  end

  test "should destroy community_news" do
    assert_difference('CommunityNews.count', -1) do
      delete community_news_url(@community_news)
    end

    assert_redirected_to community_news_index_url
  end
end
