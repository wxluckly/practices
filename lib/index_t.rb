
s = '#啦啦啦啦啦啦#发我哦个巍峨waa噶我国'

p s.index('#',1)
p s.rindex('#')

p s[s.index('#',1),s.length()].scan(/./)[1,100].join('')
