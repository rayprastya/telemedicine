class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ]

  # GET /doctors or /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1 or /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Account.new
    @account = Account.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors or /doctors.json
  def create
    @doctor = Doctor.new
    @account = Account.new(account_params.except(:name, :email, :no_hp, :gender, :experience))
    
      if @account.save
        @doctor.account = @account
        @doctor.name = account_params[:name]
        @doctor.email = account_params[:email]
        @doctor.no_hp = account_params[:no_hp]
        @doctor.gender = account_params[:gender]
        @doctor.experience = account_params[:experience]
        @doctor.save
        session[:account_id] = @account.id
        redirect_to doctors_path, notice: 'Successfully created account'
      else
        render :new
      end
  end

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
      params.require(:doctor).permit(:name, :email, :no_hp, :gender, :experience, :account_id)
    end
    def account_params
      params.require(:account).permit(:username, :password, :role)
    end
end
