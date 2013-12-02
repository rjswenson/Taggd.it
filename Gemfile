source 'https://rubygems.org'

gem 'rails', '4.0.1'
gem 'minitest-rails'

# Image Uploading
gem 'carrierwave'
gem 'mini_magick', '~> 3.7.0'
gem 'fog'

gem 'figaro'
gem 'geocoder'
gem "twitter-bootstrap-rails"
gem "therubyracer"
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

# Authorization
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook', '~> 1.5.0'
gem 'omniauth-google-oauth2', '~> 0.2.1'
gem 'devise'
gem 'pundit'

# i18n
gem 'browser-timezone-rails'
gem 'unf'
gem 'devise-i18n'
gem 'rails-i18n', '~> 4.0.0'

# Reputation System
gem 'activerecord-reputation-system', github: 'NARKOZ/activerecord-reputation-system', branch: 'rails4', require: 'reputation_system'
# gem 'merit', '~> 1.6.2'
gem 'will_paginate', '~> 3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'minitest-rails-capybara'
  gem 'minitest-colorize'
  gem 'minitest-focus'
  gem 'turn'
  gem 'sqlite3'
  gem 'launchy'
  gem 'pry-rails'
  gem 'simplecov', :require => false
  gem 'capybara-webkit'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'activerecord-postgresql-adapter'
end
