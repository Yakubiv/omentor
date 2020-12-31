source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'


gem 'rails', '~> 6.0.0'
gem 'pg', '~> 1.2.3'

gem 'pg_search', '~> 2.3.5'
gem 'meta-tags', '~> 2.14.0'
gem 'impressionist', '~> 2.0.0'
gem 'acts-as-taggable-on', '~> 7.0.0'

gem 'puma', '~> 5.1.1'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'aws-sdk-s3'
gem 'image_processing'

gem "simple_calendar", "~> 2.0"

gem 'pundit'
gem 'devise'
gem 'devise-async'
gem 'sendgrid-ruby'
gem 'local_time'
gem 'redis'
gem 'sidekiq'
gem 'cocoon'

# video
gem 'opentok', "~> 4.0.0"

gem 'money-rails', '~>1.12'

gem 'rails-jquery-autocomplete'

gem 'rubocop', '~> 0.76.0', require: false

# Inline svg
gem 'inline_svg'

gem 'pagy'

gem 'hamlit'
gem 'friendly_id'
gem 'babosa', '1.0.2'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'faker'
  gem 'dotenv-rails'
  gem 'pry', '~> 0.12.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  %w[rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails', branch: '4-0-maintenance'
  gem 'factory_bot_rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]