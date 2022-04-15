class TestMailer < ApplicationMailer
  default(template_path: "mailers/test_mailer")
  layout 'mailer'
  def test_send(email)
    @email = email
    mail(to: @email, subject: 'Test Send')
  end
end
