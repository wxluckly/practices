require 'date'


#p Time.local(Time.now.year, Time.now.month, Time.now.day).to_i

# ------------------------------------------------------------------------------

#p Time.now.hour
#
#p Time.now.year

# ------------------------------------------------------------------------------

## 失败了
#date =  DateTime.parse('2013-11-30','Y-m-d H:i')
#p date.to_i

# ------------------------------------------------------------------------------


#time = 1319262600
#p Time.at(time).strftime('%Y-%m-%d %H:%M:%S').to_s

# ------------------------------------------------------------------------------

#p Time.now.to_i
#p 1329313249

# ------------------------------------------------------------------------------

#p date =  DateTime.parse('2012-3-30')
#p time = Time.utc(date.year, date.month, date.day)
#p time.to_i

# ------------------------------------------------------------------------------

#now_time   = Time.now
#end_time   = Time.local(now_time.year, now_time.month, now_time.day).to_i
#
#p now_time
#
#p end_time
#
#p Time.now.to_i


# ------------------------------------------------------------------------------

#p Time.now.to_i

# ------------------------------------------------------------------------------

#date = Date.new(2012,3,9)
#time = Time.utc(date.year, date.month, date.day,12,30) # 和当前时间差8小时
#
#p time.to_i

# ------------------------------------------------------------------------------

#p dt = DateTime.parse('2013-11-30')
#
#p Time.utc(dt.year, dt.month, dt.day).to_i