class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :check_app_auth

  ## Выбор текущей роли и проверка прав доступа для неё у данного пользователя
  def check_app_auth()
    if current_user.nil?
      redirect_to(login_path())
    else
      @current_user_object = current_user

      @current_user_login = @current_user_object.email
      unless $online[@current_user_login]
        MessageBus.publish "/presence", {enter: @current_user_login, id: @current_user_object.id}
      end
      $online[@current_user_login] = Time.now


      @current_role_user = params[:lp_role_id]
      @current_role_user = session[:lp_role_id] if @current_role_user.nil?
      if @current_role_user.nil?
        @current_role_user = @current_user_object.role_users.first
      else
        @current_role_user = RoleUser.find(@current_role_user)
        unless @current_user_object.role_users.include?(@current_role_user)
          @current_role_user = @current_user_object.role_users.first
        end
      end
      # Сохраняем в сессию, чтобы данная роль была выбрана и дальше
      unless @current_role_user.nil?
        session[:lp_role_id] = @current_role_user.id
      end
      unless check_ctr_auth()
        redirect_to(ip_path(
          :bad_action_name => action_name,
          :bad_controller_name => controller_name,
          :bad_user_role => @current_role_user.id))
      end
      unless check_activation()
        redirect_to(ip_path(
          :bad_action_name => action_name,
          :bad_controller_name => controller_name,
          :bad_user_role => @current_role_user.id))
      end
    end
  end

  private
  # Проверка прав доступа выбранной роли для данного метода
  def check_ctr_auth()
    return @current_role_user.is_admin? || @current_role_user.is_moderator?
  end

  # Проверка активации пользователя
  def check_activation()
    return @current_user_object.role_users.first.activation_role
  end

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
