class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_dashboard_path
      else
      redirect_to user_dashboard_path(user)
      end
    else
      render :new, flash[:notice] = 'Invalid username and/or password. Please try again!'
    end
  end

  def destroy
    session[:cart] = nil
    session[:user_id] = nil
    redirect_to root_path
  end
end
