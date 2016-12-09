module DisciplinesHelper

  def type_options(selected)
		types = {0=>'лекция', 1=>'практика', 2=>'лабораторная работа', 3=>'учебная пратика/исследовательская работа'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def end_options(selected)
		ends = {0=>'зачёт', 1=>'экзамен'}
		options_for_select(ends.map { |k, v| [v, k]}, selected)
  end

  def term_options(selected)
		options_for_select(Term.all.map{ |tr| ["#{tr.term_name} ", tr.id] }, selected)
  end

  def ranking_algorithm_options(selected)
		options_for_select(RankingAlgorithm.all.map{ |ra| ["#{ra.algorithm_name} ", ra.id] }, selected)
  end

end
