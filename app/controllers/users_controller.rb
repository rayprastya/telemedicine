class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = Account.new
    @account = Account.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new

    @account = Account.new(account_params.except(:name, :email, :no_hp, :gender))
    
      if @account.save
        @user.account = @account
        @user.name = account_params[:name]
        @user.email = account_params[:email]
        @user.no_hp = account_params[:no_hp]
        @user.gender = account_params[:gender]
        @user.save
        session[:account_id] = @account.id
        redirect_to users_path, notice: 'Successfully created account'
      else
        render :new
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :no_hp, :gender, :account_id)
    end
    def account_params
      params.require(:account).permit(:username, :password, :role,:name, :email, :no_hp, :gender)
    end
end
