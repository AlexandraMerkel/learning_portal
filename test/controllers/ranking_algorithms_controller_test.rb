require 'test_helper'

class RankingAlgorithmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ranking_algorithm = ranking_algorithms(:one)
  end

  test "should get index" do
    get ranking_algorithms_url
    assert_response :success
  end

  test "should get new" do
    get new_ranking_algorithm_url
    assert_response :success
  end

  test "should create ranking_algorithm" do
    assert_difference('RankingAlgorithm.count') do
      post ranking_algorithms_url, params: { ranking_algorithm: { algorithm_name: @ranking_algorithm.algorithm_name, template: @ranking_algorithm.template } }
    end

    assert_redirected_to ranking_algorithm_url(RankingAlgorithm.last)
  end

  test "should show ranking_algorithm" do
    get ranking_algorithm_url(@ranking_algorithm)
    assert_response :success
  end

  test "should get edit" do
    get edit_ranking_algorithm_url(@ranking_algorithm)
    assert_response :success
  end

  test "should update ranking_algorithm" do
    patch ranking_algorithm_url(@ranking_algorithm), params: { ranking_algorithm: { algorithm_name: @ranking_algorithm.algorithm_name, template: @ranking_algorithm.template } }
    assert_redirected_to ranking_algorithm_url(@ranking_algorithm)
  end

  test "should destroy ranking_algorithm" do
    assert_difference('RankingAlgorithm.count', -1) do
      delete ranking_algorithm_url(@ranking_algorithm)
    end

    assert_redirected_to ranking_algorithms_url
  end
end
