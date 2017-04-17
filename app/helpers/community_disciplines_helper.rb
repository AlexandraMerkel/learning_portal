module CommunityDisciplinesHelper

    def discipline_types_to_string(chosen_types)
    types = []
    chosen_types.each do |t|
      types << Discipline::DIS_TYPES[t]
    end
    types.join(", ")
  end


  def discipline_select_options(selected)
    options_for_select(Discipline.all.map{ |ds| ["#{ds.discipline_name} ( #{discipline_types_to_string(ds.discipline_type)} ) #{Discipline::DIS_END[ds.discipline_end]} / #{ds.term.term_name} ", ds.id] }, selected)
  end

end
