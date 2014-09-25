class UsersController < ApplicationController

  def show
    @user = current_user
    @title = @user.name
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)
    if @user.save
      auto_login(@user)
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      render :new
    end
  end
  def dashboard 
    if !current_user || !current_user.role
      flash[:notice] = "You do not have access to that page!"
      redirect_to root_path
    else  
      @user = current_user
      @fb_likes = facebook_likes
      @title = "Dashboard"
    end
  end

private
  def permitted_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password)
  end

end
