# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'
  
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  config.authentication_keys = [:login]
  config.case_insensitive_keys = [:login]
  config.strip_whitespace_keys = [:login]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
