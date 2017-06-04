class CommunityContentsController < ApplicationController
  before_action :set_community_content, only: [:show, :edit, :update, :destroy]

  # GET /community_contents
  # GET /community_contents.json
  def index
    @community_contents = CommunityContent.all
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    example = '
  *This is example*
  
  1. qq
  1. qq  
  1. qq

  ***dada***  
    '
    @example = markdown.render(example)
  end

  # GET /community_contents/1
  # GET /community_contents/1.json
  def show
  end

  # GET /community_contents/new
  def new
    @community_content = CommunityContent.new
  end

  # GET /community_contents/1/edit
  def edit
  end

  # POST /community_contents
  # POST /community_contents.json
  def create
    @community_content = CommunityContent.new(community_content_params)

    respond_to do |format|
      if @community_content.save
        format.html { redirect_to @community_content, notice: 'Community content was successfully created.' }
        format.json { render :show, status: :created, location: @community_content }
      else
        format.html { render :new }
        format.json { render json: @community_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_contents/1
  # PATCH/PUT /community_contents/1.json
  def update
    respond_to do |format|
      if @community_content.update(community_content_params)
        format.html { redirect_to @community_content, notice: 'Community content was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_content }
      else
        format.html { render :edit }
        format.json { render json: @community_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_contents/1
  # DELETE /community_contents/1.json
  def destroy
    @community_content.destroy
    respond_to do |format|
      format.html { redirect_to community_contents_url, notice: 'Community content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_content
      @community_content = CommunityContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_content_params
      params.require(:community_content).permit(:view_type, :content_body, :content_visibility, :show, :community_tab_id, :creator_id)
    end
end
