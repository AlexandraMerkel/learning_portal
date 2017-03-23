module DisciplineSectionsHelper

  def section_type_options(selected)
		options_for_select(DisciplineSection::SECTION_TYPE.map { |k, v| [v, k]}, selected)
  end


  def require_type_options(selected)
  	options_for_select(DisciplineSection::REQUIRE_TYPE.map { |k, v| [v, k]}, selected)
  end

  def discipline_options(selected)
		options_for_select(Discipline.all.map{ |ds| ["#{ds.discipline_name} #{Discipline::TYPES[ds.discipline_type]} #{Discipline::DIS_END[ds.discipline_end]}", ds.id] }, selected)
  end

end
