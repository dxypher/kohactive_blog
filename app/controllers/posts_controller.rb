class PostsController < ApplicationController
  
  before_filter :setupPosts, :only => [:index, :destroy]
  
  def setupPosts
    
    @posts = Post.all
  
  end
  
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
    @post = Post.new(params[:post])
    
    if @post.save 
      redirect_to @post
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    
    redirect_to posts_path
   
  end
end
