source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
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
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'simple_command'
gem 'devise_token_auth'
# gem 'omniauth-github'
gem 'rubocop', '~> 0.58.0', require: false
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootstrap'
gem 'jquery-rails'
gem "haml-rails", "~> 1.0"
gem 'activeadmin'
gem 'devise'
gem 'cloudinary'
gem 'sendgrid-ruby'
gem "daemons"
gem 'sidekiq'
gem "haml"
gem 'has_secure_token'
gem 'jwt'
gem 'delayed_job_active_record'

gem 'cancancan', '~> 2.0'
gem 'kaminari'
gem 'dotenv-rails', groups: [:development, :test],:require => 'dotenv/load'
##Print tools
# gem 'pry'
# gem 'hirb'
# gem 'irbtools'
##pagination
# gem 'will_paginate', '~> 3.0'

gem 'simple_form'

group :development, :test do
  gem 'sqlite3'
  gem 'irbtools'
end

group :production do
  gem 'pg'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

end


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
