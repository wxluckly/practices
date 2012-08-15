require 'rubygems'
require 'curb'



curl = Curl::Easy.new
curl.timeout = 30
curl.max_redirects = 3
curl.url = "http://www.darenhui.com/cat/index"

CRUL = curl

CRUL.url = "http://www.baidu.com"
CRUL.perform
p CRUL.body_str

#--------------------------------------------------------------------------------

#curl = Curl::Easy.new
#curl.timeout = 30
#curl.max_redirects = 3
#curl.url = "http://www.darenhui.com/cat/index"
#curl.username = "slurp"
#curl.enable_cookies
#curl.perform
#p curl.body_str



#--------------------------------------------------------------------------------

#curl = Curl::Easy.new
#curl.timeout = 30
#curl.max_redirects = 3
#curl.url = "http://www.redbaby.com.cn/"
#curl.perform
#p curl.body_str
#
#body_str = curl.body_str
#url_reg = /\tvar u='(.+?)';/i
#if url_reg.match(body_str)
#  url = url_reg.match(body_str)[1]
#  p url
#end
#p '~~~~~~~~~~~~~~~~'
#p curl.header_str
#p '~~~~~~~~~~~~~~~~'

#--------------------------------------------------------------------------------

#curl = Curl::Easy.new("http://p.yiqifa.com/c?s=309300b8&w=70162&c=254&i=160&l=0&e=100000155&t=http://www.360buy.com") do|c|
#  c.head = true
# end