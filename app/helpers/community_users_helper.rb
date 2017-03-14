module CommunityUsersHelper

  def link_type_options(selected)
		options_for_select(CommunityUser::ROLES.map { |k, v| [v, k]}, selected)
  end

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

  def community_options(selected)
		options_for_select(Community.all.map{ |cm| ["#{cm.community_name} ", cm.id] }, selected)
  end

end
