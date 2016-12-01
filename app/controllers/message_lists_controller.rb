class MessageListsController < ApplicationController
  before_action :set_message_list, only: [:show, :edit, :update, :destroy]

  # GET /message_lists
  # GET /message_lists.json
  def index
    @message_lists = MessageList.all
  end

  # GET /message_lists/1
  # GET /message_lists/1.json
  def show
  end

  # GET /message_lists/new
  def new
    @message_list = MessageList.new
  end

  # GET /message_lists/1/edit
  def edit
  end

  # POST /message_lists
  # POST /message_lists.json
  def create
    @message_list = MessageList.new(message_list_params)

    respond_to do |format|
      if @message_list.save
        format.html { redirect_to @message_list, notice: 'Message list was successfully created.' }
        format.json { render :show, status: :created, location: @message_list }
      else
        format.html { render :new }
        format.json { render json: @message_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_lists/1
  # PATCH/PUT /message_lists/1.json
  def update
    respond_to do |format|
      if @message_list.update(message_list_params)
        format.html { redirect_to @message_list, notice: 'Message list was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_list }
      else
        format.html { render :edit }
        format.json { render json: @message_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_lists/1
  # DELETE /message_lists/1.json
  def destroy
    @message_list.destroy
    respond_to do |format|
      format.html { redirect_to message_lists_url, notice: 'Message list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_list
      @message_list = MessageList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_list_params
      params.require(:message_list).permit(:header)
    end
end
