class CommunityDisciplinesController < ApplicationController
  before_action :set_community_discipline, only: [:show, :edit, :update, :destroy]

  # GET /community_disciplines
  # GET /community_disciplines.json
  def index
    @community_disciplines = CommunityDiscipline.all
  end

  # GET /community_disciplines/1
  # GET /community_disciplines/1.json
  def show
  end

  # GET /community_disciplines/new
  def new
    @community_discipline = CommunityDiscipline.new
  end

  # GET /community_disciplines/1/edit
  def edit
  end

  # POST /community_disciplines
  # POST /community_disciplines.json
  def create
    @community_discipline = CommunityDiscipline.new(community_discipline_params)

    respond_to do |format|
      if @community_discipline.save
        format.html { redirect_to @community_discipline, notice: 'Community discipline was successfully created.' }
        format.json { render :show, status: :created, location: @community_discipline }
      else
        format.html { render :new }
        format.json { render json: @community_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_disciplines/1
  # PATCH/PUT /community_disciplines/1.json
  def update
    respond_to do |format|
      if @community_discipline.update(community_discipline_params)
        format.html { redirect_to @community_discipline, notice: 'Community discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_discipline }
      else
        format.html { render :edit }
        format.json { render json: @community_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_disciplines/1
  # DELETE /community_disciplines/1.json
  def destroy
    @community_discipline.destroy
    respond_to do |format|
      format.html { redirect_to community_disciplines_url, notice: 'Community discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_discipline
      @community_discipline = CommunityDiscipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_discipline_params
      params.require(:community_discipline).permit(:discipline_id, :community_id)
    end
end
