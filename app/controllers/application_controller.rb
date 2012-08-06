class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  before_filter :current_user
  before_filter :authenticate_user, only: [:create, :edit, :new, :destroy, :update]
  
  private
  
  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end
  
  def authenticate_user
    if @current_user.nil?
      redirect_to new_session_path, notice: "You must login"
    end
  end
end
