class SessionsController < ApplicationController
  def new
    unless logged_in?
      render :new
    else
      redirect_to root_url
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t "flash.email_password_invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
