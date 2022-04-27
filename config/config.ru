require_relative 'initializers/main'

map '/sidekiq' do
  use Rack::Auth::Basic, 'Protected Area' do |username, password|
    Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(username),
                               ::Digest::SHA256.hexdigest(ENV.fetch('FRONTEND_SIDEKIQ_USERNAME', 'etlbase'))) &
      Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(password),
                                 ::Digest::SHA256.hexdigest(ENV.fetch('FRONTEND_SIDEKIQ_PASSWORD', 'etlbase')))
  end
  use Rack::Session::Cookie, secret: File.read('.session.key'), same_site: true, max_age: 86_400
  run Sidekiq::Web
end
