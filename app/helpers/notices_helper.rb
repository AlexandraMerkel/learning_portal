module NoticesHelper
 
  def type_options(selected)
		types = {0=>'не уведомлять', 1=>'уведомлять на сайте', 2=>'уведомлять на сайте и по электронной почте'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

  def community_section_options(selected)
		options_for_select(CommunitySection.all.map{ |cs| ["#{cs.section_name} ", cs.id] }, selected)
  end

end
