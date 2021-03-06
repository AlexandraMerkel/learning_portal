class DisciplineSectionsController < ApplicationController
  before_action :set_discipline_section, only: [:show, :edit, :update, :destroy]

  def check_ctr_auth()
    return true if (@current_role_user.is_admin? or @current_role_user.is_teacher? or @current_role_user.is_moderator?)
  end
  # GET /discipline_sections
  # GET /discipline_sections.json
  def index
    @discipline_sections = DisciplineSection.all
  end

  # GET /discipline_sections/1
  # GET /discipline_sections/1.json
  def show
  end

  # GET /discipline_sections/new
  def new
    @discipline_section = DisciplineSection.new
  end

  # GET /discipline_sections/1/edit
  def edit
  end

  # POST /discipline_sections
  # POST /discipline_sections.json
  def create
    @discipline_section = DisciplineSection.new(discipline_section_params)
    respond_to do |format|
      if @discipline_section.save
        #format.html { redirect_to @discipline_section, notice: 'Discipline section was successfully created.' }
        #format.json { render :show, status: :created, location: @discipline_section }
        format.js { render('discipline_sections/create')}
      else
        #raise @discipline_section.errors.inspect
        #format.html { render :new }
        #format.json { render json: @discipline_section.errors, status: :unprocessable_entity }
        format.js { render ('discipline_sections/error')}
      end
    end
  end

  # PATCH/PUT /discipline_sections/1
  # PATCH/PUT /discipline_sections/1.json
  def update
    respond_to do |format|
      if @discipline_section.update(discipline_section_params)
        format.html { redirect_to @discipline_section, notice: 'Раздел дисциплины был успешно обновлен' }
        format.json { render :show, status: :ok, location: @discipline_section }
      else
        format.html { render :edit }
        format.json { render json: @discipline_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discipline_sections/1
  # DELETE /discipline_sections/1.json
  def destroy
    @discipline_section.destroy
    respond_to do |format|
      #format.html { redirect_to discipline_sections_url, notice: 'Раздел дисциплины был успешно удален' }
      #format.json { head :no_content }
      format.js { render ('discipline_sections/delete')}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline_section
      @discipline_section = DisciplineSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_section_params
      params.require(:discipline_section).permit(:discipline_type, :section_name, :section_type, :weight, :min_score, :max_score, :require_type, :attenuation_constant, :optimal_time, :limit_time, :discipline_id, :community_id)
    end
end
