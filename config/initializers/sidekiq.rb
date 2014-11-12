
	

if Rails.env.development? || Rails.env.test?
  
    Sidekiq.configure_server do |config|
      config.redis = { url: 'redis://127.0.0.1:6379/12' }
    end

   Sidekiq.configure_client do |config|
     config.redis = { url: 'redis://127.0.0.1:6379/12' }  
   end
  
end
  

#if Rails.env.production?
  
 #uri = URI.parse(ENV["REDISTOGO_URL"])
#REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password) 
  
  #Sidekiq.configure_server do |config|
 #config.redis = { url: 'redis://127.0.0.1:6379/12' }
    #config.redis = { uri }
    #config.redis = { REDIS }
    #config.redis = { ENV["REDISTOGO_URL"] }
 #end

 #Sidekiq.configure_client do |config|
 #config.redis = { url: 'redis://127.0.0.1:6379/12' }
   #config.redis = { uri }
    #config.redis = { REDIS }
    #config.redis = { ENV["REDISTOGO_URL"] }
 #end
  
#else
  
 #Sidekiq.configure_server do |config|
 #config.redis = { url: 'redis://127.0.0.1:6379/12' }
 #end

 #Sidekiq.configure_client do |config|
 #config.redis = { url: 'redis://127.0.0.1:6379/12' }
 #end
  
#end





# end


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