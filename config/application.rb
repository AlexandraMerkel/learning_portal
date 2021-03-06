require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BaseApp5
  class Application < Rails::Application
    config.time_zone = 'Europe/Moscow'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    ActiveSupport::Inflector.inflections do |inflect|
      inflect.irregular 'community_news', 'community_newses'
    end
  end
end
