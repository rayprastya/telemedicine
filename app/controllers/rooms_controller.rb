class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  @message = Message.new
  # GET /rooms or /rooms.json
  def index
    @current_user = Current.account
    redirect_to log_in unless @current_user
    @rooms = Room.all
    @users = User.all_except(@current_user)
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    def show
      @current_user = current_user
      @single_room = Room.find(params[:id])
      @rooms = Room.public_rooms
      @users = User.all_except(@current_user)
      @room = Room.new
    
      render "Chat_room_index"
end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :is_private)
    end
end
