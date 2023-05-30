if Rails.env.development?
  Rails.application.configure do
    config.action_mailer.delivery_method = :letter_opener
    config.action_mailer.perform_deliveries = true
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
  end
end
