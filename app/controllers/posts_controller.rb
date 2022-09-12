class PostsController < ApplicationController

    before_action :authenticate_user!, exclude: [:index, :show]
    #before_action :set_user, only: [:create, :edit, :show, :update, :destroy]

    def show
        @post = Post.find(params[:id])   
        @posts = Post.all
        @channels = Channel.all
    end

    def index
        @posts = Post.all
        @channels = Channel.all
    end
 
    def new
        @post = current_user.posts.build 
        @channels = Channel.all
    end

    def edit
        @post = Post.find(params[:id]) 
        @channels = Channel.all
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def update
        @post = Post.find(params[:id]) 
        # set_item
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        # set_post
        #binding.break
        @post.destroy
        redirect_to posts_path
    end

    private
    # def set_post
    #     @post = Post.find(params[:id])
    # end

    def post_params
        params.require(:post).permit(:title, :content, :channel_id)
    end

    # def set_user
    #     @user = User.find(params[:id])
    # end

end