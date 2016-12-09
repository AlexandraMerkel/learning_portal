module RoleUsersHelper

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

  def role_options(selected)
		options_for_select(Role.all.map{ |rl| ["#{rl.role_name} ", rl.id] }, selected)
  end

end
