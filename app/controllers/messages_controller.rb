class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :show_file]

  use MessageBus::Rack::Middleware

  # Переопределенная проверка прав доступа
  def check_ctr_auth()
    return true if (@current_role_user.is_admin? or @current_role_user.is_teacher? or @current_role_user.is_moderator? or @current_role_user.is_student?)
  end

  def show_file
    send_file(@message.message.path(:original),
    filename: @message.message_file_name,
    type: @message.message_content_type, disposition: 'inline')
  end

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new()
    @message.attributes=message_params

    respond_to do |format|
      #raise format.inspect
      if @message.save
        @message.message_users.each do |mu|
          MessageBus.publish '/message', {username: mu.user.email, id: mu.user.id, data: {message: @message.message_content}}
        end
        MessageBus.publish '/message', {username: @current_user_object.email, data: {message: @message.message_content}}
        #format.html { redirect_to @message, notice: 'Message was successfully created.' }
        #format.json { render :show, status: :created, location: @message }
        format.js { render('messages/create')}
      else
        #format.html { render :new }
        #format.json { render json: @message.errors, status: :unprocessable_entity }
        format.js { render('messages/errors') }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message_content, :send_time, :message, :message_list_id, :sender_id)
    end
end
