class CommunityNewsesController < ApplicationController
  before_action :set_community_news, only: [:show, :edit, :update, :destroy]

  # зависит от роли пользователя в сообществе
  def check_ctr_auth()
    return true if (@current_role_user.is_admin? or @current_role_user.is_teacher? or @current_role_user.is_moderator? or @current_role_user.is_student?)
  end
  # GET /community_news
  # GET /community_news.json

  def index
    @community_news = CommunityNews.all.page(params[:page]).per(10)
  end

  # GET /community_news/1
  # GET /community_news/1.json
  def show
  end

  # GET /community_news/new
  def new
    @community_news = CommunityNews.new
  end

  # GET /community_news/1/edit
  def edit
  end

  # POST /community_news
  # POST /community_news.json
  def create
    @community_news = CommunityNews.new(community_news_params)
    # raise 'tttttttttttttttttttttt'
    respond_to do |format|
      #raise format.inspect
      if @community_news.save
        #format.html { notice: 'Community news was successfully created.' }
        #format.json { render :show, status: :created, location: @community_news }
        format.js { render('community_news/create')}
      else
        #format.html { render :new }
        #format.json { render json: @community_news.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /community_news/1
  # PATCH/PUT /community_news/1.json
  def update
    respond_to do |format|
      if @community_news.update(community_news_params)
        format.html { redirect_to @community_news, notice: 'Community news was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_news }
      else
        format.html { render :edit }
        format.json { render json: @community_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_news/1
  # DELETE /community_news/1.json
  def destroy
    @community_news.destroy
    respond_to do |format|
      #format.html { redirect_to community_news_index_url, notice: 'Community news was successfully destroyed.' }
      #format.json { head :no_content }
      format.js { render('community_news/destroy')}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_news
      @community_news = CommunityNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_news_params
      params.require(:community_news).permit(:news_body, :user_id, :community_id)
    end
end
