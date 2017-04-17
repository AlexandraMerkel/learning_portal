class WelcomeController < ApplicationController
  ## Эти методы надо показывать всем, кто прошёл аутентификацию
  skip_before_action :check_app_auth, except: :index

  # Переопределенная проверка прав доступа
  def check_ctr_auth()
      return true if (@current_role_user.is_admin? or @current_role_user.is_teacher? or @current_role_user.is_moderator? or @current_role_user.is_student?)
  end


  def index
  end

  def insufficient_privileges
    @current_user_object = current_user
    @current_user_login = @current_user_object.email
    @current_role_user = RoleUser.find(params['bad_user_role'])
  end
end
