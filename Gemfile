source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'


gem 'rails', '~> 7'
gem 'pg', '~> 1.3.5'

gem 'pg_search', '~> 2.3.5'
gem 'meta-tags', '~> 2.16.0'
# gem 'impressionist', '~> 2.0.0'
gem 'acts-as-taggable-on', '~> 9.0.0'

gem 'hotwire-rails'
gem 'puma', '~> 5.6.4'
gem 'sass-rails', '~> 6.0.0'
gem 'webpacker', '~> 5.4.3'

gem 'jbuilder', '~> 2.11.5'

gem 'aws-sdk-s3', '~> 1.113.0'
gem 'image_processing', '~> 1.12.1'

gem "simple_calendar", "~> 2.4.1"

gem 'pundit'
gem 'devise', '4.8.1'
gem 'devise-async', '~> 1.0.0'
gem 'sendgrid-ruby', '~> 6.6.2'
gem 'local_time', '~> 2.1.0'
gem 'redis', '~> 4.6.0'
gem 'sidekiq', '~> 6.4.1'
gem 'cocoon', '~> 1.2.15'
gem 'activestorage-validator'

# video
gem 'opentok', "~> 4.3.0"

gem 'money-rails', '~>1.15.0'

gem 'rails-jquery-autocomplete', '~> 1.0.5'

gem 'rubocop', '~> 1.27.0', require: false

# Inline svg
gem 'inline_svg', '~> 1.8.0'

gem 'pagy', '~> 5.10.1'

gem 'hamlit', '~> 2.16.0'
gem 'friendly_id', '~> 5.4.1'
gem 'babosa', '2.0.0'

gem "view_component"

gem 'bootsnap', '>= 1.5.1', require: false

group :development, :test do
  gem 'faker', '~> 2.20.0'
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'pry', '~> 0.14.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '~> 4.2.0'
  gem 'listen', '~> 3.7.1'
  gem 'letter_opener', '~> 1.8.1'
  gem 'better_errors', '~> 2.9.1'
  gem 'binding_of_caller', '~> 1.0.0'
end

group :test do
  %w[rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'rspec-rails'
  gem 'factory_bot_rails', '~> 6.2.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] #Could not find gem 'tzinfo-data'.