class MessagesController < ApplicationController

  def new
    flash[:info] = t('signup_message')
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to new_message_url, notice: t('message_received')
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end

end
