class StudentsApiController < ApplicationController
  def load_from_json_file
    if params.has_key?(:json_file)
      json = File.read(params[:json_file].path)
      json = JSON.parse(json)
      @results = User.create_by_json(json)
    end
  end
end
