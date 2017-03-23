json.extract! institution, :id, :institution_name, :short_institution_name, :address, :phone_number, :created_at, :updated_at
json.url institution_url(institution, format: :json)