require 'test_helper'

class StudentsApiControllerTest < ActionDispatch::IntegrationTest
  test "should get load_from_json_file" do
    get students_api_load_from_json_file_url
    assert_response :success
  end

end
