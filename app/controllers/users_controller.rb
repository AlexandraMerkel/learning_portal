class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create, :activate]
  skip_before_action :check_app_auth, only: [:new, :create, :activate]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.page(params[:page]).per(5)
    @users = @users.search_users(params['name_of_user']).page(params[:page]).per(5) if params['name_of_user'].present?
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.institution_users.build
    @user.role_users.build
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    #raise user_params.inspect
    respond_to do |format|
      if @user.save
        format.html { redirect_to :users, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  private
    ## Переопределённая проверка прав доступа выбранной роли для данного метода
    def check_ctr_auth()
      return true if @current_role_user.is_admin?
      return (action_name.to_sym != :index or @current_role_user.is_teacher? or @current_role_user.is_moderator? or @current_role_user.is_student?)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:last_name, :first_name, :second_name, :birthday, :sex, :user_description, :email, :password, :password_confirmation,
        role_users_attributes: [:user_id, :role_id, :id, :_destroy], institution_users_attributes: [:user_id, :institution_id, :id, :_destroy])
    end
end
