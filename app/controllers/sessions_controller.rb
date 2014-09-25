class SessionsController < ApplicationController

  def new
    redirect_to root_path, notice: 'Already signed in!' if current_user
  end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      redirect_to root_path, notice: 'Signed in!'
    else
      flash[:error] = "Email or password incorrect"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end

end
