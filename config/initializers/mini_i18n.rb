MiniI18n.configure do |config|
  config.load_translations('./config/locales/*')
  config.default_locale = :en
  config.available_locales = [:en]
  config.fallbacks = false
end
