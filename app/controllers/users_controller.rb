class UsersController < ApplicationController
  def new 
    @user = User.new
  end 
  def create 
    # need to whitelist the props on the user class 
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have succesfully signed up"
      redirect_to articles_path 
    else 
      render 'new'
    end
  end 

  private 
  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end 

end