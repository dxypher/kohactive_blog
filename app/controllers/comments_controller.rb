class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.author = current_user
    if @comment.save
      redirect_to @comment
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes
    redirect_to @comment
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
  end
end
