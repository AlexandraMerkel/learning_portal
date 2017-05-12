class MarksController < ApplicationController
  before_action :set_mark, only: [:show, :edit, :update, :destroy]

  # GET /marks
  # GET /marks.json
  def index
    @marks = Mark.all
  end

  def update_mark
    respond_to do |format|
      format.js do
        @mark = Mark.where(id: params[:id]).first
        if @mark.present?
          Rails.logger.info @mark.updated_at
          @mark.touch
          @mark.update_attribute(:mark_value, params[:mark_value]) #, :report => Date.parse(params[:report]))
          Rails.logger.info @mark.updated_at
          Rails.logger.info params[:report]
          Rails.logger.info params[:teacher_id]
          Rails.logger.info '*'*100
          #@mark.update_attribute(:report, params[:report])
          #@mark.update_attribute(:teacher, params[:teacher_id])
        else
          #raise params.inspect
          #@mark = Mark.create(mark_value: params[:mark_value], report: params[:report], discipline_section: params[:discipline_section_id], student: params[:student_id], teacher: params[:teacher_id])
        end
      end
    end
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @mark = Mark.new
  end

  # GET /marks/1/edit
  def edit
  end

  # POST /marks
  # POST /marks.json
  def create
    @mark = Mark.new(mark_params)

    respond_to do |format|
      if @mark.save
        format.html { redirect_to @mark, notice: 'Mark was successfully created.' }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to @mark, notice: 'Mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to marks_url, notice: 'Mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_params
      params.require(:mark).permit(:mark_value, :report, :discipline_section_id, :student_id, :teacher_id)
    end
end
