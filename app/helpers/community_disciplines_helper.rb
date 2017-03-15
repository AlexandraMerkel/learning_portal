module CommunityDisciplinesHelper

  def discipline_options(selected)
    options_for_select(Discipline.all.map{ |ds| ["#{ds.discipline_name} #{ds.discipline_type} #{ds.discipline_end} #{ds.term} ", us.id] }, selected)
  end

end
