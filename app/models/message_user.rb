class MessageUser < ApplicationRecord
  
  belongs_to :user
  belongs_to :message

  validates :viewing, presence: true, inclusion: { in: [0, 1] }
  validates :message_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

end
