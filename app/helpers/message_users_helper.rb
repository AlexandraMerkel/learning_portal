module MessageUsersHelper

  def viewing_options(selected)
		types = {0=>'прочитано', 1=>'не прочитано'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def user_options(selected)
		options_for_select(User.all.map{ |us| ["#{us.last_name} #{us.first_name} #{us.second_name} ", us.id] }, selected)
  end

  def message_options(selected)
		options_for_select(Message.all.map{ |ms| ["#{ms.message_content} ", ms.id] }, selected)
  end

end
