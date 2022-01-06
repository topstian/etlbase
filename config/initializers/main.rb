# frozen_string_literal: true

Bundler.require(:default)
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../../lib")
loader.setup

require 'sidekiq'
require 'sidekiq/worker_killer'
require 'sidekiq-cron'

HIDATA_LINK = Hidata.link

# Sets Sidekiq default parser to Jsonizer
# module Sidekiq
#   def self.load_json(string)
#     ::Jsonizer.load(string, mode: :strict).with_indifferent_access
#   end

#   def self.dump_json(object)
#     ::Jsonizer.dump(object, mode: :compat)
#   end
# end

Sidekiq.configure_server do |config|
  config.redis = HIDATA_LINK
  config.logger.level = Logger::WARN
  config.server_middleware do |chain|
    chain.add Sidekiq::WorkerKiller, max_rss: ENV.fetch('FOREGROUND_SIDEKIQ_WORKER_KILLER_MAX_RSS', 512).to_i,
                                     grace_time: ENV.fetch('FOREGROUND_SIDEKIQ_WORKER_KILLER_GRACE_TIME', 12).to_i
    # chain.add SidekiqMiddleware
  end
end

Sidekiq.configure_client do |config|
  config.redis = HIDATA_LINK
  config.client_middleware do |chain|
    # chain.add SidekiqMiddleware
  end
end
