module UsersHelper

  def sex_options(selected)
		options_for_select(["м", "ж"], selected)
  end

  def add_institution_data(form)
    new_object = InstitutionUser.new
    fields = form.fields_for(:institution_users, new_object,
      :child_index => 'new_institution_user') do |b|
      render('institution_users/add_institution_user', addy_form: b)
    end
    {content: "#{fields}"}
  end

  def link_to_remove_iu(form)
    form.hidden_field(:_destroy, class: 'remove_fields') +
        link_to(?#, class: 'remove_fields remove_iu') do
      fa_icon('times', title: 'Удалить ВУЗ')
    end
  end

end
