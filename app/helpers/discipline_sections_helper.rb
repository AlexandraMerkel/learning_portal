module DisciplineSectionsHelper

  def section_type_options(selected)
		types = {0=>'посещаемость', 1=>'домашние задания', 2=>'проверочные/самостоятельные работы', 3=>'контрольные работы', 4=>'допольнительные задания'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def require_type_options(selected)
		types = {0=>'обязательно', 1=>'по желанию' }
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def discipline_options(selected)
		options_for_select(Discipline.all.map{ |ds| ["#{ds.discipline_name} #{ds.discipline_type} #{ds.discipline_end} ", ds.id] }, selected)
  end

end
