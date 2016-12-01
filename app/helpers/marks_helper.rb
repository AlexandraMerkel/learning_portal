module MarksHelper

  def discipline_section_options(selected)
		options_for_select(DisciplineSection.all.map{ |ds| ["#{ds.section_name} #{ds.section_type} ", ds.id] }, selected)
  end

  def student_options(selected)
		options_for_select(User.all.map{ |st| ["#{st.last_name} #{st.first_name} #{st.second_name} ", st.id] }, selected)
  end

    def teacher_options(selected)
		options_for_select(User.all.map{ |tch| ["#{tch.last_name} #{tch.first_name} #{tch.second_name} ", tch.id] }, selected)
  end


end
