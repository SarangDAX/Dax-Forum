class ChannelsController < ApplicationController
  def show
  end

  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to channels_path
    else
      render 'new'
    end
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update(channel_params)
      redirect_to channels_path
    else
      render 'edit'
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to channels_path
  end

  private
  # # def set_post
  # #     @post = Post.find(params[:id])
  # # end

  def channel_params
      params.require(:channel).permit(:channel_name)
  end
end
