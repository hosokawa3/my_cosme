class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.find(params[:id])
    post.save
  end

  def index
  end

  def show
  end

  def edit
  end
end
