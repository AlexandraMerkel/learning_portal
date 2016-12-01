module MessagesHelper

  def message_list_options(selected)
		options_for_select(MessageList.all.map{ |msl| ["#{msl.header} ", msl.id] }, selected)
  end

  def sender_options(selected)
		options_for_select(User.all.map{ |snd| ["#{snd.last_name} #{snd.first_name} #{snd.second_name} ", snd.id] }, selected)
  end

end
