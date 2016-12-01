class MessageUsersController < ApplicationController
  before_action :set_message_user, only: [:show, :edit, :update, :destroy]

  # GET /message_users
  # GET /message_users.json
  def index
    @message_users = MessageUser.all
  end

  # GET /message_users/1
  # GET /message_users/1.json
  def show
  end

  # GET /message_users/new
  def new
    @message_user = MessageUser.new
  end

  # GET /message_users/1/edit
  def edit
  end

  # POST /message_users
  # POST /message_users.json
  def create
    @message_user = MessageUser.new(message_user_params)

    respond_to do |format|
      if @message_user.save
        format.html { redirect_to @message_user, notice: 'Message user was successfully created.' }
        format.json { render :show, status: :created, location: @message_user }
      else
        format.html { render :new }
        format.json { render json: @message_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_users/1
  # PATCH/PUT /message_users/1.json
  def update
    respond_to do |format|
      if @message_user.update(message_user_params)
        format.html { redirect_to @message_user, notice: 'Message user was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_user }
      else
        format.html { render :edit }
        format.json { render json: @message_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_users/1
  # DELETE /message_users/1.json
  def destroy
    @message_user.destroy
    respond_to do |format|
      format.html { redirect_to message_users_url, notice: 'Message user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_user
      @message_user = MessageUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_user_params
      params.require(:message_user).permit(:viewing, :message_id, :user_id)
    end
end
