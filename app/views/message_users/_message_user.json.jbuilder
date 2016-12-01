json.extract! message_user, :id, :viewing, :message_id, :user_id, :created_at, :updated_at
json.url message_user_url(message_user, format: :json)