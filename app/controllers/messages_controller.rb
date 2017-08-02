class MessagesController < ApplicationController

  def new
    flash[:info] = t('signup_message')
    @message = Message.new
    render 'pages/contact'
  end

  def create
    @message = Message.new message_params

    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to thankyou_path, notice: t('message_received')
    else
      redirect_to contact_path, notice: @message.errors
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end

end
