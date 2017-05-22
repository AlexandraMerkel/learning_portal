class MarksController < ApplicationController
  before_action :set_mark, only: [:show, :edit, :update, :destroy]

  def check_ctr_auth()
    return true if (@current_role_user.is_admin? or @current_role_user.is_teacher? or @current_role_user.is_moderator? or @current_role_user.is_student?)
  end

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
          if params[:mark_value].empty?
            @mark.destroy
          else
            @mark.update_attributes(:mark_value => params[:mark_value], :teacher_id => params[:teacher_id])
          end
        else
          @mark = Mark.create(mark_value: params[:mark_value], discipline_section_id: params[:discipline_section_id], student_id: params[:student_id], teacher_id: params[:teacher_id])
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
