class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :insure_logon



  private
    def insure_logon
      unless session[:current_user]
        redirect_to controller: :users, action: :login
      end
    end

end
