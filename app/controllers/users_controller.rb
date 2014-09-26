class UsersController < ApplicationController

  def show
    @user = current_user
    @title = @user.name
  end

  def new
    @user = User.new
  end

  def edit
    @roles = ["admin", "editor", "author", "intern", "standard"]
    @admins = User.where(role: "admin")
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permitted_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(permitted_params)
    if User.count == 0
      @user.role = "admin"
    elsif User.count > 0
      @user.role = "standard"
    end
    if @user.save
      auto_login(@user)
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      render :new
    end
  end
  def dashboard 
    if !current_user || !current_user.role || current_user.role.downcase == "standard"
      flash[:notice] = "You do not have access to that page!"
      redirect_to root_path
    else  
      @user = current_user
      @users = User.all.sort_by &:role
      @fb_likes = facebook_likes
      @title = "Dashboard"
    end
  end

private
  def permitted_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :role)
  end

end
