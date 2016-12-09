module CommunityTabsHelper

  def community_section_options(selected)
		options_for_select(CommunitySection.all.map{ |cs| ["#{cs.section_name} ", cs.id] }, selected)
  end

end
