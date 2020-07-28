require 'resque/server'
if Rails.env.development? || Rails.env.test?
  Resque.redis = Redis.new(:host => 'redis', :port => '6379')
else
  uri = URI.parse(ENV['REDISTOGO_URL'])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

  Resque.redis = REDIS
end
