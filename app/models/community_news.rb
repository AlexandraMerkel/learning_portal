class CommunityNews < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_and_belongs_to_many :users

  validates :news_body, presence: true

  def self.table_name
    "community_news"
  end

end
