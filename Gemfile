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
gem 'sass-rails', '~> 6.0.0'
gem 'webpacker', '~> 5.2.1'
gem 'turbolinks', '~> 5.2.1'
gem 'jbuilder', '~> 2.10.1'

gem 'aws-sdk-s3', '~> 1.87.0'
gem 'image_processing', '~> 1.12.1'

gem "simple_calendar", "~> 2.4.1"

gem 'pundit'
gem 'devise', '4.7.3'
gem 'devise-async', '~> 1.0.0'
gem 'sendgrid-ruby', '~> 6.3.8'
gem 'local_time', '~> 2.1.0'
gem 'redis', '~> 4.2.5'
gem 'sidekiq', '~> 6.1.2'
gem 'cocoon', '~> 1.2.15'

# video
gem 'opentok', "~> 4.1.2"

gem 'money-rails', '~>1.13.3'

gem 'rails-jquery-autocomplete', '~> 1.0.5'

gem 'rubocop', '~> 0.76.0', require: false

# Inline svg
gem 'inline_svg', '~> 1.7.2'

gem 'pagy', '~> 3.10.0'

gem 'hamlit', '~> 2.13.2'
gem 'friendly_id', '~> 5.4.1'
gem 'babosa', '1.0.4'

gem 'bootsnap', '>= 1.5.1', require: false

group :development, :test do
  gem 'faker', '~> 2.15.1'
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'pry', '~> 0.13.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '~> 4.1.0'
  gem 'listen', '~> 3.3.3'
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'letter_opener', '~> 1.7.0'
  gem 'better_errors', '~> 2.9.1'
  gem 'binding_of_caller', '~> 1.0.0'
end

group :test do
  gem 'capybara', '~> 3.34.0'
  gem 'selenium-webdriver', '~> 3.142.7'
  gem 'webdrivers', '~> 4.4.2'
  %w[rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails', branch: '4-0-maintenance'
  gem 'factory_bot_rails', '~> 6.1.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] #Could not find gem 'tzinfo-data'.