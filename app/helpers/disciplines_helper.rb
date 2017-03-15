module DisciplinesHelper

  def discipline_type_options(selected)
		options_for_select(Discipline::TYPES.map { |k, v| [v, k]}, selected)
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

end
