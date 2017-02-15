class GroupsApiController < ApplicationController
  def load_from_json_file
    sleep(10)
    if params.has_key?(:json_file)
      json = File.read(params[:json_file].path)
      json = JSON.parse(json)
      @results = Group.create_by_json(json)
    end
  end
end
