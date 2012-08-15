#content = '<p>年中店庆第二波！千款商品<font color="000000"><font color="333333">2.7</font>折</font>起！例如这款<font color="3366FF"><a href="http://p.yiqifa.com/c?s=893502f8&amp;w=426673&amp;c=272&amp;i=137&amp;l=0&amp;e=1&amp;t=http://item.mbaobao.com/pshow-1207019101.html">约会系列菱格纹单肩包</a></font>，满减后69元，也挺不错的了。<font color="3366FF"><a href="http://p.yiqifa.com/c?s=893502f8&amp;w=426673&amp;c=272&amp;i=137&amp;l=0&amp;e=1&amp;t=http://item.mbaobao.com/pshow-1211006502.html">简约时尚撞色单肩包</a></font>，折扣后159元也还行。女包的折后价格有点高，男包的折扣之后还挺划算。感兴趣的网友去仔细挑挑吧，可以进去后按折扣排序找折扣商品。<span style="color: rgb(51, 51, 51); font-family: Verdana, "BitStream vera Sans", Tahoma, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; orphans: 2; text-align: -webkit-auto; text-indent: 26px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none; " class="Apple-style-span"></span><span style="color: rgb(51, 51, 51); font-family: 宋体; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none; " class="Apple-style-span"></span></p>'
#
#p content
#p content.gsub(/(<a\s*[^>]+?href=['"][^'"]+['"])/,'\1 target="_blank"')

# ---------------------------------------------------------------------------

#c = "'乔伊思JOICE 2011新款韩版女装纯色中长袖收腰通勤秋款OL雪纺衬衫 7313 米色 L''"
#
#
#p c.gsub(/'/,"aaa")


# ---------------------------------------------------------------------------

#content = "#http://www.darenhui.com/user/100000741?ref=bind-105-publish#"
#topic_reg = /^\s*#([^#]+)#/i
#    title = content.scan(topic_reg)[0][0]
#p title
#
#
#p content.gsub!("#"+title+"#","")

# ---------------------------------------------------------------------------

#content = 'access_token=52484494420f5b5080f766cffcfb251b&expires_in=604800&name=wxluckly'
#
#
#p content[content.index("access_token")+13,32]

# ---------------------------------------------------------------------------

#require 'rubygems'
#require 'json'

#content = '{"expires_in":2592305,"refresh_token":"191360|0.YkW5Y6W1e3jnLLCqpW1Vr3cnILCqE2Mc.242855629","user":{"id":242855629,"name":"?..榫.,",avatar":[{"type":"avatar","url":"http:\/\/hdn.xnimg.cn\/photos\/hdn121\/20111120\/1310\/h_head_fCZZ_20a20007a15e2f75.jpg"},{"type":"tiny","url":"http:\/\/hdn.xnimg.cn\/photos\/hdn121\/20111120\/1315\/tiny_DfMI_84417g019118.jpg"},{"type":"main","url":"http:\/\/hdn.xnimg.cn\/photos\/hdn121\/20111120\/1310\/h_main_yfDI_20a20007a15e2f75.jpg"},{"type":"large","url":"http:\/\/hdn.xnimg.cn\/photos\/hdn121\/20111120\/1310\/h_large_yolt_20a20007a15e2f75.jpg"}]},"access_token":"191360|6.ebdff1ab200a073c40ee98552a97e6c8.2592000.1338001200-242855629"}'
#
#result = JSON.parse(content)
#
#p result



#p content[content.index("access_token")+16,69]

#content = 'callback( {"client_id":"100258260","openid":"DCE7F9681D47E55FB8DEE6CF6DDC9467"} )'
#p content[content.index("openid")+9,32]

# ---------------------------------------------------------------------------

#content = 'access_token=38866A380C93AD7218A08A6AC904D636&expires_in=7776000'
#
#p content.split("&")[0].split("=")[1]
#p content.split("&")[1].split("=")[1]

# ---------------------------------------------------------------------------

content = "系统监控到用户@风车365 @风车 为了重复领取优惠券，不断创建虚假用户，现已进行禁言处理！"
call_users = content.scan(%r{@([^@\s：:]+)})
p call_users
call_users.each do |user|
#  p user[0].to_s
#  p user[1]
  p user
  user_url = '/user/content/'+user[0].to_s
#  p user_url
  content = content.gsub!('@'+user[0], '<a href="'+user_url+'"><@>'+user[0]+'</a>')
end
content.gsub!('<@>','@')
#p content

# ---------------------------------------------------------------------------

#content = "#活跃之星大赢家，你挑商品我买单#3.27-4.5日期间登陆达人汇，集齐相应数目活跃之星勋章，可任意挑选价值300/200/100元喜欢的商品(如何获取活跃之星勋章参看：[6LACj=http://www.darenhui.com/m]...>>>  http://t.cn/zOX9yxV  （分享自 @达人汇）"
#
#content = content.gsub(/\[([^=\[\]]+)=([^=\[\]]+)\]/i){|match| $2}
#
#content = content.gsub(/\[([^=\[\]]+)=([^=\[\]]+)\]/i){|match| DrhwebService::LinkService.dynamic(nil, "/u/#{$1}","")}
#
#p content


# ---------------------------------------------------------------------------

#candidate = 'http://www.google.com.hk/webhp?hl=zh-CN&sourceid=cnhp#q=url+%E8%A7%84%E8%8C%83&hl=zh-CN&newwindow=1&safe=strict&site=webhp&prmd=imvns&ei=eXFxT4XKBaesiAeCt9HkDw&start=20&sa=N&bav=on.2,or.r_gc.r_pw.,cf.osb&fp=98f9b5c4e15e56db&biw=1366&bih=677 发文'

#p candidate.gsub('haveERP=1','haveERP=0')

# ---------------------------------------------------------------------------

#candidate = 'http://www.google.com.hk/webhp?hl=zh-CN&sourceid=cnhp#q=url+%E8%A7%84%E8%8C%83&hl=zh-CN&newwindow=1&safe=strict&site=webhp&prmd=imvns&ei=eXFxT4XKBaesiAeCt9HkD;w&start=20&sa=N&bav=on.2,or.r_gc.r_pw.,cf.osb&fp=98f9b5c4e15e56db&biw=1366&bih=677 发文'

#candidate = 'http://www.darenhui.com/cat?ref=c-064-catL2_3&amp;path=6-96'
#
#candidate.gsub!(%r{(http://[0-9a-zA-Z\/\?\.&=_\%#+,-;]+)}i){|match|
#       p match }


#email = 'wxluckly@gmail.com.cn'
#p email.match(%r{^[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+(?:(?:\.[a-zA-Z0-9_-]{2,3}){1,2})$})
#p email. match(%r{.})
#p email.match(%r{[^a-zA-Z0-9\s]})


# ---------------------------------------------------------------------------

#content = "www.darenhui.com/cat/124311211?faew=faew&ref=faewge"
#content = "www.darenhui.com/cat/124311211?ref=faewge&faew=faew"
#content = "www.darenhui.com/cat/124311211?faew=faew&ref=faewge&re23f=faewge#faewge"
#content = "www.darenhui.com/cat/124311211?ref=faewge#faewge"
#content = "www.darenhui.com/cat/1?ref=c-016_3-hotTag&tag=55#main_content"

#path_reg = /(cat\/.+)/
#content_filter_path =  content.match(path_reg)[1]
#
#ref_reg1 = %r[\?ref=.+?&]
#ref_reg2 = %r[&ref=.+?&]
#ref_reg3 = %r[\?ref=.+?#|&ref=.+?#]
#ref_reg4 = %r[\?ref=.+|\&ref=.+]
#
#case content_filter_path
#when ref_reg1 then content_filter_path.gsub!(ref_reg1,'?')
#when ref_reg2 then content_filter_path.gsub!(ref_reg2,'&')
#when ref_reg3 then content_filter_path.gsub!(ref_reg3,'#')
#when ref_reg4 then content_filter_path.gsub!(ref_reg4,'')
#end

#ancher_reg = %r[#.+]
#content_filter_path.gsub!(ancher_reg,'')

#p content_filter_path

# ---------------------------------------------------------------------------

#content = "www.darenhui.com/item/124311211?ref=faewge"
#
#item_reg = /item\/(\d{9,10})/
##第一次匹配后、获取第一个被呼叫人
#p item_reg.match(content)
#p content.match(item_reg)
#p content.match(item_reg)[1]
#p content.match(/item\/(\d{9,10})/)[1]

# ---------------------------------------------------------------------------


#a = '联想 (lenovo)(23)'
#a.gsub!(/\(\d+\)/,"")
#a.gsub!(/[\(\)]/," ")
#p a