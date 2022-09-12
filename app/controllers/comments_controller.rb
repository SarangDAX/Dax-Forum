class CommentsController < ApplicationController

  before_action :authenticate_user!, exclude: [:index, :show]
  # before_action :set_post, only: [:create, :edit, :show, :update, :destroy]
  # before_action :set_comment, only: [:create, :edit, :show, :update, :destroy]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def show
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    #binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    set_user
    if @comment.save!
      redirect_to post_comments_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end 

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_comments_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:reply)
  end

  # def set_post
  #   @post = Post.find(params[:post_id])
  # end

  def set_user
    @comment.user_id = current_user.id
  end

end
