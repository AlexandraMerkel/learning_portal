class GroupsApiController < ApplicationController

  def load_from_json_file
    #sleep(10)
    if params.has_key?(:json_file)
      json = File.read(params[:json_file].path)
      json = JSON.parse(json)
      @results = Group.create_by_json(json)
    end
  end

  def load_to_json_file
    data = Group.all.to_json
    send_data data, :type => 'application/json; header=present', :disposition => "attachment; filename=groups.json"
  end

  private
    def check_ctr_auth()
      return true if @current_role_user.is_admin?
      return (action_name.to_sym != :load_from_json_file or @current_role_user.is_moderator?)
    end

end
