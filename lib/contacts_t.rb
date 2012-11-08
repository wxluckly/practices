require 'rubygems'
require 'activesupport'
require 'contacts_joey'

p Contacts.new(:gmail,"wxl1test@gmail.com", "wxluckly").contacts
p Contacts.new(:yahoo,"wxl_test@yahoo.cn", "111aaa").contacts
p Contacts.new(:yahoo,"wxl_test@yahoo.com.cn", "111aaa").contacts
p Contacts.new(:net_ease,"wxl_test@126.com","111aaa").contacts
p Contacts.new(:net_ease,"wxl_test@163.com","111aaa").contacts
p Contacts.new(:hotmail,"wangxinlong.ehaohai@hotmail.com", "tijava!!!").contacts   # 不支持中文

#contacts = Contacts.new(:gmail,"wxl1test@gmail.com", "wxluckly").contacts
#p contacts[0][0]

#p Contacts.new(:sina,"wxlllh1205@sina.com","tijava!!!").contacts  # 有错误，无法通过
#p Contacts.new(:sohu,"wxlonely@sohu.com","tijava!!!").contacts # 改了协议，无法通过

