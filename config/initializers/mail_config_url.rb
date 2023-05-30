if Rails.env.development?
  Rails.application.configure do
    config.action_mailer.asset_host = Rails.application.credentials.app_url
  end
end
