# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  domain: 'http://studygo.com.ua',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true,
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY']
}
