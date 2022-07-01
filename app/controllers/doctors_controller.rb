class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session

  # GET /doctors or /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1 or /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @user = User.new
    @doctor = User.new
  end

  def create
    @doctor = Doctor.new
    @user = User.new(user_params.except(:experience))
    if @user.save
      @doctor.user = @user
      @doctor.experience = user_params[:experience]
      @doctor.save
    # stores saved user id in a session
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new
    end
  end


  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors or /doctors.json
  # def create
  #   @doctor = Doctor.new(doctor_params)

  #   respond_to do |format|
  #     if @doctor.save
  #       format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully created." }
  #       format.json { render :show, status: :created, location: @doctor }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @doctor.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1 or /doctors/1.json
  def destroy
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:user_id, :experience)
    end

    def user_params
      # strong parameters
      params.require(:user).permit(:username, :password, :password_confirmation, :experience)
    end
end
