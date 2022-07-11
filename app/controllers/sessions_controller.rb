 class SessionsController < ApplicationController
    def new
    end
    def create
      account = Account.find_by(username: params[:username], password: params[:password])
      # finds existing user, checks to see if user can be authenticated
      if account.present? 
      # sets up user.id sessions
        session[:account_id] = account.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      # deletes user session
      session[:account_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
  end