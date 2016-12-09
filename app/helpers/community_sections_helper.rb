module CommunitySectionsHelper

  def community_options(selected)
		options_for_select(Community.all.map{ |cm| ["#{cm.community_name} ", cm.id] }, selected)
  end

  def section_type_options(selected)
		types = {0=>'новости', 1=>'успеваемость', 2=>'учебные материалы', 3=>'форум'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

  def section_position_options(selected)
		types = {0=>'1-ый', 1=>'2-ой', 2=>'3-ий', 3=>'4-ый'}
		options_for_select(types.map { |k, v| [v, k]}, selected)
  end

end
