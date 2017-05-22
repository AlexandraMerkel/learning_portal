class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]

  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = Discipline.all.page(params[:page]).per(10)
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)
    #raise discipline_params.inspect
    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: 'Дисциплина успешно создана' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Дисциплина успешно обновлена' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    if (@discipline.discipline_sections.blank? && @discipline.community_disciplines.blank?)
      @discipline.destroy
      message = "Дисциплина успешно удалена"
      respond_to do |format|
        format.html { redirect_to disciplines_url, notice: message }
        format.json { head :no_content }
      end
    else
      message = "Произошла ошибка при удалении дисциплины: на данную дисциплину ссылаются другие объекты системы"
      respond_to do |format|
        format.html { redirect_to @discipline, notice: message }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:discipline_name, :discipline_end, :term_id, :ranking_algorithm_id, discipline_type: [])
    end
end
