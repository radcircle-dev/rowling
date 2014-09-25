class UsersController < ApplicationController

  def show
    @user = current_user
    #@user = User.find(params[:id])
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
    @user = current_user
    @fb_likes = facebook_likes
  end

private
  def permitted_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password)
  end

end
