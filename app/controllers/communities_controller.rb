class CommunitiesController < ApplicationController
  before_action :set_community, only: [:archiving, :show, :edit, :update, :destroy]

  def archiving()
    @community.update_columns(archive: '1')
    flash[:notice] = 'Сообщество отправлено в архив!'
  end

  def dearchiving
    # тут будет метод
  end

  # GET /communities
  # GET /communities.json
  def index
    if @current_role_user.is_student? or @current_role_user.is_teacher?
      @communities = Community.check_access_to_community(@current_user_object.id)
    else
      @communities = Community.all
    end
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    @community
    @community_news = @community.community_newses.build(community: @community, user: @current_user_object) # для подключения community_news/form
    @community_news_index = @community.community_newses
   # Rails.logger.info @community_news_index[0]
   # Rails.logger.info '*'*100
    @check = Community.check_access_to_edit_community(@current_user_object.id, @community.id) # проверяем доступ к редактированию сообщества
  end


  # GET /communities/new
  def new
    @community = Community.new(community_visibility: 0)
    @community.community_disciplines.build
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)
    #raise community_params.inspect
    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: 'Сообщество успешно создано' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: 'Сообщество успешно обновлено' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Сообщество успешно удалено' }
      format.json { head :no_content }
    end
  end

  private
    ## Переопределённая проверка прав доступа выбранной роли для данного метода
    def check_ctr_auth()
      return true if @current_role_user.is_admin?
      return (action_name.to_sym != :new or @current_role_user.is_moderator?)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      #community = Community.find(params[:id])
      @community = Community.includes(community_disciplines: {discipline: {discipline_sections: :marks}}, community_users: :user).find(params[:id])
      #@community = Community.includes(community_disciplines: {discipline: {discipline_sections: {marks: :student}}}, ).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:community_name, :community_visibility, :archive, community_disciplines_attributes: [:discipline_id, :community_id, :id, :_destroy],
        community_users_attributes: [:link_type, :user_id, :community_id, :id, :_destroy])
    end
end
