# #config/initializers/redis.rb
# require 'redis'


# REDIS_CONFIG = YAML.load( File.open( Rails.root.join("config/redis.yml") ) ).symbolize_keys
# dflt = REDIS_CONFIG[:default].symbolize_keys
# cnfg = dflt.merge(REDIS_CONFIG[Rails.env.to_sym].symbolize_keys) if REDIS_CONFIG[Rails.env.to_sym]

# #$redis = Redis.new(cnfg)
# $redis = Redis.new(:host => 'localhost', :port => 6379)
# #Redis::Objects.redis = $redis
# #$redis_ns = Redis::Namespace.new(cnfg[:namespace], :redis => $redis) if cnfg[:namespace]

# # To clear out the db before each test
# $redis.flushdb if Rails.env = "test"



# #$redis = Redis.new(:host => 'localhost', :port => 6379)
# # #uri = URI.parse(URI.encode(ENV["REDIS_PROVIDER"].strip))
# # uri = URI.parse(ENV["REDIS_PROVIDER"] )
# # #REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
# # REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

# #note: These lines may be necessary in production
# #if Rails.env.production?
# #uri = URI.parse(ENV["REDISTOGO_URL"])
# #REDIS = Redis.new(:host => uri.host, :port => uri.port, :password =>     uri.password)
# #end