class CommunityNews < ApplicationRecord
  belongs_to :creator, class_name: "User",foreign_key: "user_id"
  belongs_to :community
  has_and_belongs_to_many :users, join_table: :community_newses_users

  validates :news_body, presence: true

  def self.table_name
    "community_news"
  end

end
