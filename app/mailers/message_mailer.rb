class MessageMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact.subject
  #
  def contact(message)
    @email = message.email
    @name = message.name
    @body = message.body

    mail to: 'bob@spirit-it.org', subject: 'Sool Bar Week Contact Form', from: @email
  end
end
