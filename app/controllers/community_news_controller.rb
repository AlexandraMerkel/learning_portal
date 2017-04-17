class CommunityNewsController < ApplicationController
  before_action :set_community_news, only: [:show, :edit, :update, :destroy]

  # GET /community_news
  # GET /community_news.json
  def index
    @community_news = CommunityNews.all
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

    respond_to do |format|
      if @community_news.save
        format.html { redirect_to @community_news, notice: 'Community news was successfully created.' }
        format.json { render :show, status: :created, location: @community_news }
      else
        format.html { render :new }
        format.json { render json: @community_news.errors, status: :unprocessable_entity }
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
      format.html { redirect_to community_news_index_url, notice: 'Community news was successfully destroyed.' }
      format.json { head :no_content }
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
