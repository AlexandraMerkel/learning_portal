module InstitutionUsersHelper

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

  def institution_select_options(selected)
		options_for_select(Institution.all.map{ |inst| ["#{inst.institution_name} ", inst.id] }, selected)
  end

end
