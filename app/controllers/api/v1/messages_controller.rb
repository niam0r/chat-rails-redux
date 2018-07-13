class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = @channel.messages.order('created_at ASC')
    render json: messages
  end

  # def show
  #   message = Message.find(params[:id])
  #   render json: message
  # end

  def create
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.save
    render json: message # see Message.as_json method
  end


  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  # def message_params
  #   params.require(:message).permit(:content, :channel, :user)
  # end
end
