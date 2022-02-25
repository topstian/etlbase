# frozen_string_literal: true

require_relative 'initializers/main'

map '/sidekiq' do
  use Rack::Auth::Basic, 'Protected Area' do |username, password|
    Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(username),
                               ::Digest::SHA256.hexdigest(ENV.fetch('FOREGROUND_SIDEKIQ_USERNAME', 'etlbase'))) &
      Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(password),
                                 ::Digest::SHA256.hexdigest(ENV.fetch('FOREGROUND_SIDEKIQ_PASSWORD', 'etlbase')))
  end
  # run Sidekiq::Web
end
