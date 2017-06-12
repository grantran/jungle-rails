class ExampleMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def sample_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: order.id)
  end

end
