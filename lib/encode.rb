require 'cgi'
require 'uri'

a= "http://www.darenhui.com/m?ref=ii-060_0&t=product&pid=2262&categoryid=57&id=52 哈哈"
p URI::encode(a)

# --------------------------------------------------------

#a = "22,12,15,132"
#p CGI::escape(a)
#
#a = "http://www.darenhui.com/cat/1?tag=55%23main_content"
#p CGI::unescape(a)
