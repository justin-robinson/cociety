require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OpenSourceSociety
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.autoload_paths << Rails.root.join('lib')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.active_job.queue_adapter = :sidekiq

    ENV['REDIS_HOST'] ||= 'localhost'
    ENV['REDIS_PORT'] ||= '6379'
    ENV['REDIS_URL'] ||= "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}"
    ENV['SIDEKIQ_REDIS_URL'] ||= "#{ENV['REDIS_URL']}/0"
  end
end
