# Require gems
Bundler.require(:default, ENV.fetch('STAGE', 'development').to_sym)

# Setups Zeitwerk
ZEITWERK_LOADER = Zeitwerk::Loader.new
ALL_DIRS = Dir.glob('**/*/')
ZEITWERK_PUSH_DIRS = ['lib/', 'app/'].freeze
ZEITWERK_PUSH_DIRS.each do |push_dir|
  ALL_DIRS.each do |dir|
    ZEITWERK_LOADER.push_dir("#{__dir__}/../../#{dir}") if dir.include?(push_dir)
  end
end
ZEITWERK_LOADER.setup

# Creates connection pool to Hidata
# Use only this for the whole app
HIDATA_LINK = Hidata.link

# Starts Sidekiq
# It's here because the frontend needs that also
require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq/worker_killer'
require 'sidekiq-cron'

# Sets Sidekiq default parser to Jsonizer
module Sidekiq
  def self.load_json(string)
    ::Jsonizer.load(string, mode: :strict).with_indifferent_access
  end

  def self.dump_json(object)
    ::Jsonizer.dump(object, mode: :compat)
  end
end

# Setups Sidekiq server
# Using HIDATA_LINK and WorkerKiller
Sidekiq.configure_server do |config|
  config.redis = HIDATA_LINK
  config.logger.level = Logger::WARN
  config.server_middleware do |chain|
    chain.add Sidekiq::WorkerKiller, max_rss: ENV.fetch('BACKEND_SIDEKIQ_WORKER_KILLER_MAX_RSS', 512).to_i,
                                     grace_time: ENV.fetch('BACKEND_SIDEKIQ_WORKER_KILLER_GRACE_TIME', 12).to_i
    # chain.add SidekiqMiddleware
  end
end

# Setups Sidekiq client
# Using HIDATA_LINK
Sidekiq.configure_client do |config|
  config.redis = HIDATA_LINK
  config.client_middleware do |chain|
    # chain.add SidekiqMiddleware
  end
end
