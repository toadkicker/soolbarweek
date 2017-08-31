source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'popper_js'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec-rails'
  gem 'i18n-spec'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'
  gem 'codecov', :require => false
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'newrelic_rpm'
  gem 'redis-rails'
  gem 'redis-rack-cache'
  gem 'redis-session-store'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'i18n'
gem 'rails-i18n', '~> 5.0.0'
gem 'i18n-active_record', :require => 'i18n/active_record'

gem 'paperclip'
gem 'paperclip-av-transcoder'

gem 'bootstrap', '= 4.0.0.alpha6'
gem 'font-awesome-rails'
gem 'handlebars'
gem 'money-rails', '~> 1.9.0'
gem 'google_currency'

gem 'devise'
gem 'devise-i18n'
gem 'aws-sdk'
gem 'aws-sdk-rails'

gem 'friendly_id', '~> 5.1.0'
gem 'geocoder'

gem 'tagsinput-rails'
gem 'stripe'

gem 'exception_handler'
gem 'aws-healthcheck'


ruby "2.4.1"