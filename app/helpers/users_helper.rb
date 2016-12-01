module UsersHelper

  def sex_options(selected)
		options_for_select(["м", "ж"], selected)
  end

end
