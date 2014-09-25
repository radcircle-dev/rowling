class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_params)
    if @post.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(permitted_params)
      redirect_to root_path
    else
      render :edit
    end
  end

private
  def permitted_params
    params.require(:post).permit(:name,
                                 :content)
  end

end
