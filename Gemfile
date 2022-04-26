source 'https://rubygems.org'
ruby '3.0.3'

# Wraps connections inside a pool
gem 'connection_pool'
# Minimalistic I18n
gem 'mini_i18n'
# Fast JSON Parser
gem 'oj'
# IRB Extended
gem 'pry'
# Application server
gem 'puma'
# Redis driver for intensive use
gem 'hiredis'
# Rack middleware
gem 'rack'
# Base Redis driver
gem 'redis', require: ['redis', 'redis/connection/hiredis']
# Secure generator
gem 'securerandom'
# Background processor
gem 'sidekiq'
# Schedules to Sidekiq
gem 'sidekiq-cron'
# Avoids memory bloat killing workers
gem 'sidekiq-worker-killer'
# DSL framework for web apps
gem 'sinatra-contrib'
# Fast cURL wrapper
gem 'typhoeus'
# Code loader like magic
gem 'zeitwerk'

group :test, :development do
  # Acceptance framework
  gem 'capybara'
  # RSpec testing framework
  gem 'rspec'
end
