require 'test_helper'

class DisciplineSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discipline_section = discipline_sections(:one)
  end

  test "should get index" do
    get discipline_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_discipline_section_url
    assert_response :success
  end

  test "should create discipline_section" do
    assert_difference('DisciplineSection.count') do
      post discipline_sections_url, params: { discipline_section: { attenuation_constant: @discipline_section.attenuation_constant, discipline_id: @discipline_section.discipline_id, limit_time: @discipline_section.limit_time, max_score: @discipline_section.max_score, min_score: @discipline_section.min_score, optimal_time: @discipline_section.optimal_time, require_type: @discipline_section.require_type, section_name: @discipline_section.section_name, section_type: @discipline_section.section_type, weight: @discipline_section.weight } }
    end

    assert_redirected_to discipline_section_url(DisciplineSection.last)
  end

  test "should show discipline_section" do
    get discipline_section_url(@discipline_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_discipline_section_url(@discipline_section)
    assert_response :success
  end

  test "should update discipline_section" do
    patch discipline_section_url(@discipline_section), params: { discipline_section: { attenuation_constant: @discipline_section.attenuation_constant, discipline_id: @discipline_section.discipline_id, limit_time: @discipline_section.limit_time, max_score: @discipline_section.max_score, min_score: @discipline_section.min_score, optimal_time: @discipline_section.optimal_time, require_type: @discipline_section.require_type, section_name: @discipline_section.section_name, section_type: @discipline_section.section_type, weight: @discipline_section.weight } }
    assert_redirected_to discipline_section_url(@discipline_section)
  end

  test "should destroy discipline_section" do
    assert_difference('DisciplineSection.count', -1) do
      delete discipline_section_url(@discipline_section)
    end

    assert_redirected_to discipline_sections_url
  end
end
