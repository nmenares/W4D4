class SessionsController < ApplicationController
  def new
    render :new
  end

  def create #loggin
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = "Login information not found"
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
