class Message < ApplicationRecord
 
  belongs_to :message_list
  belongs_to :sender, :class_name => 'User'
  has_many :message_users

  validates :message_content, presence: true
  validates :message_list_id, presence: true
  validates :sender_id, presence: true

end
