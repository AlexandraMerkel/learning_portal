module DisciplineSectionsHelper

  def discipline_type_options(selected)
    options_for_select(Discipline::DIS_TYPES.map { |k, v| [v, k]}, selected)
  end

  def section_type_options(selected)
    options_for_select(DisciplineSection::SECTION_TYPE.map { |k, v| [v, k]}, selected)
  end

  def require_type_options(selected)
    options_for_select(DisciplineSection::REQUIRE_TYPE.map { |k, v| [v, k]}, selected)
  end

end