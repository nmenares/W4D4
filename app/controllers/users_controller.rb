class UsersController < ApplicationController

  def show
    render :show
  end

  def new
   @user = User.new
   render :new
  end

  def create  #sign up
    @user = User.new(user_params)

    if User.find_by(email: @user.email)
      flash[:error] = "Username already taken"
      redirect_to new_user_url
    elsif @user.save
        login(@user)
        redirect_to user_url(@user)
    else
      flash[:error] = "Password too short"
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
