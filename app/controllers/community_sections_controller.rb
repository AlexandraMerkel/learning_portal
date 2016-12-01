class CommunitySectionsController < ApplicationController
  before_action :set_community_section, only: [:show, :edit, :update, :destroy]

  # GET /community_sections
  # GET /community_sections.json
  def index
    @community_sections = CommunitySection.all
  end

  # GET /community_sections/1
  # GET /community_sections/1.json
  def show
  end

  # GET /community_sections/new
  def new
    @community_section = CommunitySection.new
  end

  # GET /community_sections/1/edit
  def edit
  end

  # POST /community_sections
  # POST /community_sections.json
  def create
    @community_section = CommunitySection.new(community_section_params)

    respond_to do |format|
      if @community_section.save
        format.html { redirect_to @community_section, notice: 'Community section was successfully created.' }
        format.json { render :show, status: :created, location: @community_section }
      else
        format.html { render :new }
        format.json { render json: @community_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_sections/1
  # PATCH/PUT /community_sections/1.json
  def update
    respond_to do |format|
      if @community_section.update(community_section_params)
        format.html { redirect_to @community_section, notice: 'Community section was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_section }
      else
        format.html { render :edit }
        format.json { render json: @community_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_sections/1
  # DELETE /community_sections/1.json
  def destroy
    @community_section.destroy
    respond_to do |format|
      format.html { redirect_to community_sections_url, notice: 'Community section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_section
      @community_section = CommunitySection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_section_params
      params.require(:community_section).permit(:section_name, :section_type, :section_position, :community_id)
    end
end
