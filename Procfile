#procfile for production

web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb

#web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
#web: rails s
#worker: bundle exec sidekiq -c 5 -v
#worker: bundle exec sidekiq
#worker: ./script/worker
#redis: redis-server