module CommunityDisciplinesHelper

  def discipline_select_options(selected)
    options_for_select(Discipline.all.map{ |ds| ["#{ds.discipline_name} ( #{Discipline::TYPES[ds.discipline_type]} ) #{Discipline::DIS_END[ds.discipline_end]} / #{ds.term.term_name} ", ds.id] }, selected)
  end

end
