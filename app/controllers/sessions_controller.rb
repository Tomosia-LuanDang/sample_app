class SessionsController < ApplicationController
  def new
    logged_in? ? redirect_to(root_url) : render(:new)
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash[:warning] = t "flash.account_not_activate"
        redirect_to root_url
      end
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
