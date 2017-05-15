class RankingAlgorithmsController < ApplicationController
  before_action :set_ranking_algorithm, only: [:show, :edit, :update, :destroy]

  # GET /ranking_algorithms
  # GET /ranking_algorithms.json
  def index
    @ranking_algorithms = RankingAlgorithm.all.page(params[:page]).per(10)
  end

  # GET /ranking_algorithms/1
  # GET /ranking_algorithms/1.json
  def show
  end

  # GET /ranking_algorithms/new
  def new
    @ranking_algorithm = RankingAlgorithm.new
  end

  # GET /ranking_algorithms/1/edit
  def edit
  end

  # POST /ranking_algorithms
  # POST /ranking_algorithms.json
  def create
    @ranking_algorithm = RankingAlgorithm.new(ranking_algorithm_params)

    respond_to do |format|
      if @ranking_algorithm.save
        format.html { redirect_to @ranking_algorithm, notice: 'Алгоритм успешно создан' }
        format.json { render :show, status: :created, location: @ranking_algorithm }
      else
        format.html { render :new }
        format.json { render json: @ranking_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranking_algorithms/1
  # PATCH/PUT /ranking_algorithms/1.json
  def update
    respond_to do |format|
      if @ranking_algorithm.update(ranking_algorithm_params)
        format.html { redirect_to @ranking_algorithm, notice: 'Алгоритм успешно обновлен' }
        format.json { render :show, status: :ok, location: @ranking_algorithm }
      else
        format.html { render :edit }
        format.json { render json: @ranking_algorithm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranking_algorithms/1
  # DELETE /ranking_algorithms/1.json
  def destroy
    @ranking_algorithm.destroy
    respond_to do |format|
      format.html { redirect_to ranking_algorithms_url, notice: 'Алгоритм успешно удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking_algorithm
      @ranking_algorithm = RankingAlgorithm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ranking_algorithm_params
      params.require(:ranking_algorithm).permit(:algorithm_name, :template)
    end
end
