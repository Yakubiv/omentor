require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Omentor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.generators.assets = false
    config.generators.helper = false
    config.autoload_paths += %W[ lib/ ]
    config.generators do |g|
      g.test_framework :rspec
    end
    config.action_view.form_with_generates_remote_forms = false
    config.active_storage.replace_on_assign_to_many = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
