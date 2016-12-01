require 'test_helper'

class InstitutionUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @institution_user = institution_users(:one)
  end

  test "should get index" do
    get institution_users_url
    assert_response :success
  end

  test "should get new" do
    get new_institution_user_url
    assert_response :success
  end

  test "should create institution_user" do
    assert_difference('InstitutionUser.count') do
      post institution_users_url, params: { institution_user: { institution_id: @institution_user.institution_id, rank: @institution_user.rank, user_id: @institution_user.user_id } }
    end

    assert_redirected_to institution_user_url(InstitutionUser.last)
  end

  test "should show institution_user" do
    get institution_user_url(@institution_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_institution_user_url(@institution_user)
    assert_response :success
  end

  test "should update institution_user" do
    patch institution_user_url(@institution_user), params: { institution_user: { institution_id: @institution_user.institution_id, rank: @institution_user.rank, user_id: @institution_user.user_id } }
    assert_redirected_to institution_user_url(@institution_user)
  end

  test "should destroy institution_user" do
    assert_difference('InstitutionUser.count', -1) do
      delete institution_user_url(@institution_user)
    end

    assert_redirected_to institution_users_url
  end
end
