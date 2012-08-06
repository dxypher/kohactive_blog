class SessionsController < ApplicationController
  
  skip_before_filter :authenticate_user, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user])
    if @user.persisted?
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
