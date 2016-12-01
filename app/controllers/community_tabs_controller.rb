class CommunityTabsController < ApplicationController
  before_action :set_community_tab, only: [:show, :edit, :update, :destroy]

  # GET /community_tabs
  # GET /community_tabs.json
  def index
    @community_tabs = CommunityTab.all
  end

  # GET /community_tabs/1
  # GET /community_tabs/1.json
  def show
  end

  # GET /community_tabs/new
  def new
    @community_tab = CommunityTab.new
  end

  # GET /community_tabs/1/edit
  def edit
  end

  # POST /community_tabs
  # POST /community_tabs.json
  def create
    @community_tab = CommunityTab.new(community_tab_params)

    respond_to do |format|
      if @community_tab.save
        format.html { redirect_to @community_tab, notice: 'Community tab was successfully created.' }
        format.json { render :show, status: :created, location: @community_tab }
      else
        format.html { render :new }
        format.json { render json: @community_tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_tabs/1
  # PATCH/PUT /community_tabs/1.json
  def update
    respond_to do |format|
      if @community_tab.update(community_tab_params)
        format.html { redirect_to @community_tab, notice: 'Community tab was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_tab }
      else
        format.html { render :edit }
        format.json { render json: @community_tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_tabs/1
  # DELETE /community_tabs/1.json
  def destroy
    @community_tab.destroy
    respond_to do |format|
      format.html { redirect_to community_tabs_url, notice: 'Community tab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_tab
      @community_tab = CommunityTab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_tab_params
      params.require(:community_tab).permit(:community_section_id, :tab_name, :tab_position)
    end
end
