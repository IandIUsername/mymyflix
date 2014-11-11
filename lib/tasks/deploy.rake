require 'paratrooper'
#to deploy use " $rake deploy:production" or rake deploy:staging

 namespace :deploy do
   desc 'Deploy app in staging environment'
   task :staging do
     deployment = Paratrooper::Deploy.new("immense-ocean-8511", tag: 'staging')

     deployment.deploy
   end

   namespace :deploy do
     desc 'Deploy app in production environment'
     task :production do
       deployment = Paratrooper::Deploy.new("immense-ocean-8511", tag: 'proudction')

     deployment.deploy
   end
   
 ?
# namespace :deploy do
# desc 'Deploy app in staging environment'
# task :staging do
#   deployment = Paratrooper::Deploy.new("amazing-staging-app", tag: 'staging')

#   deployment.deploy
# end

# desc 'Deploy app in production environment'
# task :production do
#   deployment = Paratrooper::Deploy.new("amazing-production-app") do |deploy|
#     deploy.tag              = 'production'
#     deploy.match_tag        = 'staging'
#   end

#   deployment.deploy
# end
# end