class StudentsApiController < ApplicationController
  

  def load_from_json_file
    sleep(10)
    if params.has_key?(:json_file)
      json = File.read(params[:json_file].path)
      json = JSON.parse(json)
      @results = User.create_by_json(json)
    end
  end

  # Нужен ли модератору доступ к API? (тут сделан)
  private
    def check_ctr_auth()
      return true if @current_role_user.is_admin?
      return (action_name.to_sym != :load_from_json_file or @current_role_user.is_moderator?)
    end
 
end
