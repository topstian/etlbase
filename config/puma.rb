# frozen_string_literal: true

port 3000
workers ENV.fetch('FRONTEND_PUMA_WORKERS', 2).to_i
threads ENV.fetch('FRONTEND_PUMA_MIN_THREADS', 5).to_i, ENV.fetch('FRONTEND_PUMA_MAX_THREADS', 5).to_i
rackup './config/config.ru'
