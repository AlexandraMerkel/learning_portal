class MessageList < ApplicationRecord
  
  # has_and_belongs_to_many :message_list_users
  has_many :messages

end
