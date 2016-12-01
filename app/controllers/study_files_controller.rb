class StudyFilesController < ApplicationController
  before_action :set_study_file, only: [:show, :edit, :update, :destroy]

  # GET /study_files
  # GET /study_files.json
  def index
    @study_files = StudyFile.all
  end

  # GET /study_files/1
  # GET /study_files/1.json
  def show
  end

  # GET /study_files/new
  def new
    @study_file = StudyFile.new
  end

  # GET /study_files/1/edit
  def edit
  end

  # POST /study_files
  # POST /study_files.json
  def create
    @study_file = StudyFile.new(study_file_params)

    respond_to do |format|
      if @study_file.save
        format.html { redirect_to @study_file, notice: 'Study file was successfully created.' }
        format.json { render :show, status: :created, location: @study_file }
      else
        format.html { render :new }
        format.json { render json: @study_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_files/1
  # PATCH/PUT /study_files/1.json
  def update
    respond_to do |format|
      if @study_file.update(study_file_params)
        format.html { redirect_to @study_file, notice: 'Study file was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_file }
      else
        format.html { render :edit }
        format.json { render json: @study_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_files/1
  # DELETE /study_files/1.json
  def destroy
    @study_file.destroy
    respond_to do |format|
      format.html { redirect_to study_files_url, notice: 'Study file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_file
      @study_file = StudyFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_file_params
      params.require(:study_file).permit(:user_id, :study)
    end
end
