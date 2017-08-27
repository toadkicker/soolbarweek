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

    mail to: 'bobspirit-it@gmail.com', from: 'no-reply@soolbarweek.com', subject: 'Sool Bar Week Contact Form'
  end
end
