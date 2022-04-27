Bundler.require(:default, ENV.fetch('STAGE', 'development').to_sym)

require_relative 'zeitwerk'
require_relative 'hidata'
require_relative 'active_support'
require_relative 'oj'
require_relative 'mini_i18n'
require_relative 'sidekiq'
