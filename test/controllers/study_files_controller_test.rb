require 'test_helper'

class StudyFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_file = study_files(:one)
  end

  test "should get index" do
    get study_files_url
    assert_response :success
  end

  test "should get new" do
    get new_study_file_url
    assert_response :success
  end

  test "should create study_file" do
    assert_difference('StudyFile.count') do
      post study_files_url, params: { study_file: { study: @study_file.study, user_id: @study_file.user_id } }
    end

    assert_redirected_to study_file_url(StudyFile.last)
  end

  test "should show study_file" do
    get study_file_url(@study_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_file_url(@study_file)
    assert_response :success
  end

  test "should update study_file" do
    patch study_file_url(@study_file), params: { study_file: { study: @study_file.study, user_id: @study_file.user_id } }
    assert_redirected_to study_file_url(@study_file)
  end

  test "should destroy study_file" do
    assert_difference('StudyFile.count', -1) do
      delete study_file_url(@study_file)
    end

    assert_redirected_to study_files_url
  end
end
