module JobHelper
  include ApplicationHelper
  include Sidekiq::Worker
  sidekiq_options queue: 'default', retry: 5
end
