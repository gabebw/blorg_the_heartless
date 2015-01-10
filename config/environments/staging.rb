require_relative "production"

Rails.application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.blorg_the_heartless.com' }
end
