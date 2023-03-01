# frozen_string_literal: true

redis_config = {
  url: ENV.fetch('REDIS_URL'),
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
}

Sidekiq.default_worker_options = if Rails.env.production?
                                   { retry: 10 }
                                 else
                                   { retry: 1 }
                                 end

Sidekiq.configure_server do |config|
  config.redis = redis_config

  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../sidekiq_scheduler.yml', __dir__))
    Sidekiq::Scheduler.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
