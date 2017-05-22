module DisciplinesHelper

  def discipline_type_options(selected)
		options_for_select(Discipline::DIS_TYPES.map { |k, v| [v, k]}, selected)
  end

  def discipline_end_options(selected)
		options_for_select(Discipline::DIS_END.map { |k, v| [v, k]}, selected)
  end

  def term_options(selected)
		options_for_select(Term.all.map{ |tr| ["#{tr.term_name} ", tr.id] }, selected)
  end

  def ranking_algorithm_options(selected)
		options_for_select(RankingAlgorithm.all.map{ |ra| ["#{ra.algorithm_name} ", ra.id] }, selected)
  end

  def discipline_types(chosen_types)
    types = []
    chosen_types.each do |t|
      types << Discipline::DIS_TYPES[t]
    end
    types.join(", ")
  end

  def discipline_short_types(chosen_type)
    Discipline::SHORT_TYPES[chosen_type]
  end

  def discipline_end_types(chosen_type)
    Discipline::DIS_END[chosen_type]
  end

  def add_discipline_data(form)
    new_object = CommunityDiscipline.new
    fields = form.fields_for(:community_disciplines, new_object,
      :child_index => 'new_community_discipline') do |builder|
      render('community_disciplines/add_community_discipline', addy_form: builder)
    end
    {content: "#{fields}"}
  end

  def link_to_remove_dis(form)
    form.hidden_field(:_destroy, class: 'remove_fields') +
        link_to(?#, class: 'remove_fields remove_dis') do
      fa_icon('times', title: 'Удалить дисциплину')
    end
  end

end
