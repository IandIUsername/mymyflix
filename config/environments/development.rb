Myflix::Application.configure do
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.default_url_options = { host: '127.0.0.1:3000' }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.eager_load = false
  
  
  
  
#    config.action_mailer.delivery_method = :smtp
#   config.action_mailer.smtp_settings = { 
#     :address => "smtp.gmail.com",
#     :port    => 587,
#     :domain  => 'baci.lindsaar.net',
#     :user_name => '<username>',
#     :password  => '<password>',
#     :authentication => 'plain',
  #     :enable_starttls_auto => true }
  
# ENV["REDISTOGO_URL"] = 'redis://redistogo:30346774d912f6130a5d981b90eb01bd@greeneye.redistogo.com:11024/'
  #ENV["REDISTOGO_URL"] = 'redis://username:password@my.host:6389'
end
