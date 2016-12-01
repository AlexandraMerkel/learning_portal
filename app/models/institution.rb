class Institution < ApplicationRecord

  has_many :institution_users
  has_and_belongs_to_many :disciplines

  validates :institution_name, presence: true, uniqueness: true
  validates :short_institution_name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true

end
