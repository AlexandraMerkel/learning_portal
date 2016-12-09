class StudyFile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  has_attached_file :study, 
  path: ":rails_root/storage/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment :study, file_name: {matches: /\.(pdf|docx|doc|tiff)\z/i} # валидация на тип файла

end
