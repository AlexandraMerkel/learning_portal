json.extract! notice, :id, :notice_type, :user_id, :community_section_id, :created_at, :updated_at
json.url notice_url(notice, format: :json)