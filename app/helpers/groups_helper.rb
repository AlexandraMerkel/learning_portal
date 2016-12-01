module GroupsHelper

  def term_options(selected)
		options_for_select(Term.all.map{ |tr| ["#{tr.term_name} ", tr.id] }, selected)
  end

end
