module RoleUsersHelper

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

  # позволяет выбрать только роль студента или преподавателя (?)
  def role_select_options(selected)
		options_for_select(Role.all.select{ |rl| rl.role_name_eng == "teacher" || rl.role_name_eng == "student"}.map{ |rl| ["#{rl.role_name} ", rl.id] }, selected)
  end

end
