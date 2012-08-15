require 'rubygems'
require 'drhbo'


#Drhbo::WEB_REDIS.hset("user.100000683","item_history","100929905,100929907")

#Drhbo::WEB_REDIS.hset("user.100000683","item_history",nil)

Drhbo::WEB_REDIS.hdel("user.100000683","item_history")

Drhbo::WEB_REDIS.hincrby("user.100000683","item_history",-5)

p Drhbo::WEB_REDIS.hget("user.100000683","item_history")



#p nil.to_i

p "done"

#Drhbo::WEB_REDIS.rpush("stat.users_most_like_items.list",100101151)
#p "done"

#p Drhbo::WEB_REDIS.LRANGE("stat.users_most_like_items.list",0,-1)

#p Drhbo::WEB_REDIS.LLEN("stat.users_most_like_items.list")

#p Drhbo::WEB_REDIS.hget("redpacket.",".detected") ||"afe"


#Drhbo::WEB_REDIS.Lset("stat.users_most_like_items.list",1,100000111)


#Drhbo::WEB_REDIS.LTRIM("stat.users_most_like_items.list",2,1)
#
#p Drhbo::WEB_REDIS.LRANGE("stat.users_most_like_items.list",0,-1)

#Drhbo::WEB_REDIS.LREM("stat.users_most_like_items.list",Drhbo::WEB_REDIS.LLEN("stat.users_most_like_items.list"))