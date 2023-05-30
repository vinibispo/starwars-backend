if Rails.env.development? || Rails.env.production?
  Rails.application.configure do
    config.action_mailer.asset_host = APP_URL
  end
end
