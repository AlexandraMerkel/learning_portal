module CommunitiesHelper

  def archive_options(selected)
		types = {0=>'функционирует', 1=>'в архиве'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def visibility_options(selected)
		types = {0=>'видно для всех пользователей', 1=>'видно владельцу и модераторам/редакторам сообщества', 2=>'видно только владельцу сообщества'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

end
