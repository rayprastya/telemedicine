class ApplicationController < ActionController::Base
  before_action :set_current_user
    def set_current_user
      # finds user with session data and stores it if present
      Current.account = Account.find_by(id: session[:account_id]) if session[:account_id]
    end
  
    def require_user_logged_in!
      # allows only logged in user
      redirect_to sign_in_path, alert: 'You must be signed in' if Current.account.nil?
    end
end
