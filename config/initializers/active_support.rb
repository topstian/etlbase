require 'active_support/all'

# Sets default timezone
Time.zone_default = Time.find_zone!(ENV.fetch('DEFAULT_TIMEZONE', 'America/Santiago'))
