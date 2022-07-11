class RegistrationsController < ApplicationController
    # instantiates new user
    protect_from_forgery with: :null_session
    def new
      @user = Account.new
      @account = Account.new
    end
    def create
      @account = Account.new(account_params)
      if @account.save
      # stores saved user id in a session
        session[:account_id] = @account.id
        redirect_to log_in_path, notice: 'Successfully created account'
      else
        render :new
      end
    end
    private
    def account_params
      # strong parameters
      params.require(:account).permit(:username, :password)
    end
  end