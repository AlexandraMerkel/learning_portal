module CommunityUsersHelper

  def link_type_options(selected)
		types = {0=>'участник', 1=>'редактор', 2=>'модератор', 3=>'владелец'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

  def community_options(selected)
		options_for_select(Community.all.map{ |cm| ["#{cm.community_name} ", cm.id] }, selected)
  end

end
