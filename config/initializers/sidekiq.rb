#should this be 6379/12 a originally shown in the documentation or should it be 6379/0 as when I run $redis in the console and get #<Redis client v3.1.0 for redis://localhost:6379/0> 

#xxxxx
# Sidekiq.configure_server do |config|
# config.redis = { url: 'redis://127.0.0.1:6379/12' }
# end

# Sidekiq.configure_client do |config|
# config.redis = { url: 'redis://127.0.0.1:6379/12' }
# end
#xxxxx
# Sidekiq.configure_server do |config|
# config.redis = { url: 'redis://redis.example.com:6379/12' }
# end

# Sidekiq.configure_client do |config|
# config.redis = { url: 'redis://redis.example.com:6379/12' }
# end


#NOT ORIGINAL, FROM stackoverflow help:
# Sidekiq.configure_server do |config|
# config.redis = { :url => 'redis://localhost:6379', :namespace => 'sidekiq' }
# end

# Sidekiq.configure_client do |config|
# config.redis = { :url => 'redis://localhost:6379', :namespace => 'sidekiq' }
# end


#NOTE: The configuration hash must have symbolized keys.

#NOTE: Replace "7372" with the port you're using for Redis.

# You can also set the Redis url using environment variables. This makes configuring Sidekiq on Heroku dead simple.

# Set the REDIS_PROVIDER env var to the name of the env var containing the Redis server url. (Example with RedisGreen: set REDIS_PROVIDER=REDISGREEN_URL and Sidekiq will use the value of the REDISGREEN_URL env var when connecting to Redis.)

# You may also use the generic REDIS_URL which may be set to your own private Redis server.