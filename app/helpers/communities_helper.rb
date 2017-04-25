module CommunitiesHelper

  def community_archive_options(selected)
		options_for_select(Community::ARCHIVES.map { |k, v| [v, k]}, selected)
  end


  def community_archive_types(chosen_type)
    Community::ARCHIVES[chosen_type]
  end

  def community_visibility_options(selected)
		options_for_select(Community::VISIBILITIES.map { |k, v| [v, k]}, selected)
  end

  def community_visibility_types(chosen_type)
		Community::VISIBILITIES[chosen_type]
  end

  def check_access_to_edit_community(user_attr, comm_attr)
    Community.includes(:community_users).where("community_users.user_id = ?", user_attr).where("community_users.community_id = ?", comm_attr).references(:community_users).pluck("community_users.link_type").first
  end

  def add_user_data(form)
    new_object = CommunityUser.new
    fields = form.fields_for(:community_users, new_object,
      :child_index => 'new_community_user') do |builder|
      render('community_users/add_community_user', addy_form: builder)
    end
    {content: "#{fields}"}
  end

  def link_to_remove_cu(form)
    form.hidden_field(:_destroy, class: 'remove_fields') +
        link_to(?#, class: 'remove_fields remove_cu') do
      fa_icon('times', title: 'Удалить пользователя')
    end
  end
end
