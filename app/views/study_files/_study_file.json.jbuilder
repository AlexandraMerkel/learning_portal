json.extract! study_file, :id, :user_id, :study, :created_at, :updated_at
json.url study_file_url(study_file, format: :json)