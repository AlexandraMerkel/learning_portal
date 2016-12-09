module CommunityContentsHelper

  def view_type_options(selected)
		types = {0=>'html', 1=>'markdown'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
   end

   def visibility_options(selected)
		types = {0=>'виден всем участникам сообщества', 1=>'виден только владельцу и модераторам/редакторам сообщества', 2=>'отложенная публикация'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def community_tab_options(selected)
		options_for_select(CommunityTab.all.map{ |ct| ["#{ct.tab_name} ", ct.id] }, selected)
  end

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

end
