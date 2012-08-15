require 'rubygems'
require 'contactlist-client'

contacts = ContactList::Client.fetch("wxl_test@163.com", "111aaa", "163")

contacts.each do |contact|
  p "username: #{contact.username}, email: #{contact.email}"
end
# 通过不了，报超时错误