module GroupsHelper

  def term_options(selected)
		options_for_select(Term.all.map{ |tr| ["#{tr.term_name} ", tr.id] }, selected)
  end

  def search_disciplines(group)
    answer = []
    group.users.each do |u|
      u.community_users.each do |cu|
        cu.community.community_disciplines.each do |cd|
          answer << cd.discipline
        end
      end
    end
    answer.uniq
  end

end
