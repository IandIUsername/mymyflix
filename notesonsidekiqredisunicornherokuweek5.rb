#redis-server
#rails s
#bundle exec sidekiq

# remember to start redis server before running sidekiq
# remember also to run rails server before starting sidekiq
# note that you have the unicorn gem so that may be an issue as when you run rails server it might run unicorn
# remember that you have not yet placed******, as per advice 
# 'vm.overcommit_memory = 1' *** how do you open a file on nitrous that you cannot navigate to directly****????
# in etc/syscontrol.conf
# actually you added it manually, well tried to
# did not work manually, now cannot find the file, no redis in the filesystem. tried reinstalling under etc but no change.
# remember that you changed the from local host to 127.0.0.1 as per perham on the getaddr info 
# config file for redis notice that path to config file has not been set upon running reddis server
# config file for sidekiq
# initializer for redis
# initializer for sidekiq

# how to stop a unicorn server


#**** is there an issue with the socket rails server is running on?
# 
# # > Booting Thin                                                       
# => Rails 4.1.1 application starting in development on http://0.0.0.0:3000                                    
# => Run `rails server -h` for more startup options                                                            
# => Notice: server is listening on all interfaces (0.0.0.0). Consider using 127.0.0.1 (--binding option)      
# => Ctrl-C to shutdown server                                                                                 
# >> Thin web server (v1.5.0 codename Knife)                                                                   
# >> Maximum connections set to 1024                                                                           
# >> Listening on 0.0.0.0:3000, CTRL+C to stop

# Loading development environment (Rails 4.1.1)                                                                
# 2.1.1 :001 > AppMailer.delay.send_invitation_email(Invitation.first)                                         
# Invitation Load (0.2ms)  SELECT  "invitations".* FROM "invitations"   ORDER BY "invitations"."id" ASC LIMIT
# 1                                                                                                           
# => "fe529d4df0f1149f156d751c"                                                                               
# 2.1.1 :002 >   

#****************what is the difference between an initializer and a config file and what is the significance of ending with .rb or .yml or .config?

#what is the issue with the bin/stubs file?

#how to kill rails server without ctrl c

# up vote
# 65
# down vote
# accepted
# You can use other ports like the following:

# rails server -p 3001
# Normally in your terminal you can try Ctrl + C to shutdown the server.

# The other way to kill the Ruby on Rails default server (which is WEBrick) is:

# kill -INT $(cat tmp/pids/server.pid)
# In your terminal to find out the PID of the process:

# $ lsof -wni tcp:3000
# Then, use the number in the PID column to kill the process:

# For example:

# $ kill -9 PID
# And some of the other answers i found is:

# To stop the rails server while it's running, press:

# CTRL-C
# CTRL-Z
# You will get control back to bash. Then type (without the $):

# $ fg
# And this will go back into the process, and then quit out of Rails s properly.

# It's a little annoying, but this sure beats killing the process manually. It's not too bad and it's the best I could figure out.

# Updated answer:

# You can use killall -9 rails to kill all running apps with "rails" in the name.

# killall -9 rails


#how to kill a unicorn server


# 7
# down vote
# I would probably go with:

# sudo pkill unicorn_rails
# share|improve this answer
# answered Jan 20 '11 at 16:49

# Mike Williamson
# 7,04183359
# 1	 	
# I believe this is the best answer, I did sudo pkill unicorn though –  JoseE Mar 24 '13 at 2:37
# add a comment
# up vote
# 4
# down vote
# Interesting that no-one considered the pid file that unicorn creates? My usual config puts it in ./tmp/unicorn.pid, so perhaps the safest way is

# kill -QUIT `cat tmp/unicorn.pid`
# and the pid file is then properly deleted by the departing process. I always put the pid file in the same relative place so I guess I could alias that for convenience, although when I am developing I don't usually daemonize unicorn.

#note get redis to go url from heroku --app APP or navigate to the heroku to go add on itself.  	 	

# Remember to add before_fork and after_fork hooks if you are using unicorn. devcenter.heroku.com/articles/rails-unicorn#caveats Also, Redis To Go docs: redistogo.com/documentation/resque –  Rafael Oliveira Aug 28 '13 at 20:41

# For me, i had to do heroku labs:enable user-env-compile -a myapp to get it to read my ENV vars during deployment. –  courtsimas Feb 19 at 17:05