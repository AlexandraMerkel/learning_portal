module CommunitiesHelper

  def community_archive_options(selected)
		types = {0=>'функционирует', 1=>'в архиве'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def community_archive_types(chosen_type)
    types = {0=>'функционирует', 1=>'в архиве'}
    types[chosen_type]
  end

  def community_visibility_options(selected)
		types = {0=>'видно для всех пользователей', 1=>'видно владельцу и модераторам/редакторам сообщества', 2=>'видно только владельцу сообщества'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def community_visibility_types(chosen_type)
		types = {0=>'видно для всех пользователей', 1=>'видно владельцу и модераторам/редакторам сообщества', 2=>'видно только владельцу сообщества'}
		types[chosen_type]
  end

end
