# require_relative '../../lib/middleware/sidekiq_localization_middleware'

# Sidekiq.configure_server do |config|
# config.server_middleware do |chain|
#   chain.add SidekiqLocalizationMiddleware
# end

schedule_file = 'config/schedule.yml'
Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?
# end
