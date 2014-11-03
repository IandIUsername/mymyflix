Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis.example.com:7372/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis.example.com:7372/12' }
end
#NOTE: The configuration hash must have symbolized keys.

#NOTE: Replace "7372" with the port you're using for Redis.

# You can also set the Redis url using environment variables. This makes configuring Sidekiq on Heroku dead simple.

# Set the REDIS_PROVIDER env var to the name of the env var containing the Redis server url. (Example with RedisGreen: set REDIS_PROVIDER=REDISGREEN_URL and Sidekiq will use the value of the REDISGREEN_URL env var when connecting to Redis.)

# You may also use the generic REDIS_URL which may be set to your own private Redis server.