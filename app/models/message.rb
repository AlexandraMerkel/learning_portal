class Message < ApplicationRecord

  belongs_to :message_list
  belongs_to :sender, :class_name => 'User'
  has_many :message_users

  validates :message_content, presence: true
  validates :message_list_id, presence: true
  validates :sender_id, presence: true

  has_attached_file :message, path: ":rails_root/storage/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment :message, file_name: {matches: /\.(pdf|docx|doc|tiff)\z/i} # проверка на тип файла

  #after_commit :create_message_sender_link

  def create_message_sender_link
    MessageUser.create(message: self.id, user: self.sender)
  end

end