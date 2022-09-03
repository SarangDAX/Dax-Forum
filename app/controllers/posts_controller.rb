class PostsController < ApplicationController

    # def show
    #     @post = Post.find(params[:id])   
    # end

    def index
        @posts = Post.all
    end
 
    def new
        @post = Post.new 
    end

    def edit
        @post = Post.find(params[:id]) 
    end

    def create
        @post = Post.new(post_params)
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
        # set_item
        #binding.break
        @post.destroy
        redirect_to posts_path
    end

    private
    # # def set_item
    # #     @item = Kitchen.find(params[:id])
    # # end

    def post_params
        params.require(:post).permit(:title, :content)
    end

end