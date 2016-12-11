class WelcomeController < ApplicationController
  ## Эти методы надо показывать всем, кто прошёл аутентификацию
  skip_before_action :check_app_auth, except: :index

  def index
  end

  def insufficient_privileges
    @current_user_object = current_user
    @current_user_login = @current_user_object.email
    @current_role_user = RoleUser.find(params['bad_user_role'])
  end
end
