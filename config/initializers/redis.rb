$redis = Redis.new(:host => 'localhost', :port => 6379)

uri = URI.parse(ENV["REDIS_PROVIDER"] )
#REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)