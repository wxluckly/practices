require 'rubygems'
require 'thread'
require 'drhdao'
require 'drhbo'
require 'erb'

items = []
item_hash = {}
male_items = []
male_item_hash = {}
female_items = []
female_item_hash = {}
sql = 'SELECT target_id,gender FROM likes l,users u WHERE target_type = 1 AND is_like = 1 AND u.id = l.user_id AND updated_at > ?'
sql_items = DrhModels::Like.find_by_sql([sql,Time.now.to_i-3600*24*30])
# 不区分男女性别的结果集
sql_items.each do |item|
  if item_hash[item.target_id.to_s]
    item_hash[item.target_id.to_s] = item_hash[item.target_id.to_s].to_i + 1
  else
    item_hash[item.target_id.to_s] = 1
  end
end
item_hash.each_key {|item_id|items << {:item_id =>item_id,:num => item_hash[item_id] }}
items.sort!{ |item1, item2| item2[:num]<=> item1[:num] }
Drhbo::WEB_REDIS.LTRIM("stat.users_most_like_items.list",2,1)
items[0,36].each do |item|
  Drhbo::WEB_REDIS.RPUSH("stat.users_most_like_items.list",item[:item_id].to_i)
end

# 区分男女性别用户的结果集
sql_items.each do |item|
  if item.gender.to_s == "1"
    if male_item_hash[item.target_id.to_s]
      male_item_hash[item.target_id.to_s] = male_item_hash[item.target_id.to_s].to_i + 1
    else
      male_item_hash[item.target_id.to_s] = 1
    end
  else
    if female_item_hash[item.target_id.to_s]
      female_item_hash[item.target_id.to_s] = female_item_hash[item.target_id.to_s].to_i + 1
    else
      female_item_hash[item.target_id.to_s] = 1
    end
  end
end
male_item_hash.each_key {|item_id|male_items << {:item_id =>item_id,:num => male_item_hash[item_id] }}
male_items.sort!{ |item1, item2| item2[:num]<=> item1[:num] }
Drhbo::WEB_REDIS.LTRIM("stat.male_users_most_like_items.list",2,1)
male_items[0,36].each do |item|
  Drhbo::WEB_REDIS.RPUSH("stat.male_users_most_like_items.list",item[:item_id].to_i)
end
female_item_hash.each_key {|item_id|female_items << {:item_id =>item_id,:num => female_item_hash[item_id] }}
female_items.sort!{ |item1, item2| item2[:num]<=> item1[:num] }
Drhbo::WEB_REDIS.LTRIM("stat.female_users_most_like_items.list",2,1)
female_items[0,36].each do |item|
  Drhbo::WEB_REDIS.RPUSH("stat.female_users_most_like_items.list",item[:item_id].to_i)
end


 p "all done"

#p Drhbo::WEB_REDIS.ZCARD(Drhdao::DrhRedis::ONLINEUSERS_KEY)
#
#
#
#user_ids = [100000155,100000111]
#
#users = DrhModels::User.find(:all,:select=>"nick_name,head_image_id",:conditions=>["id in (?)",user_ids])
#
#p users

#    # 给清空状态的红包增加新的时间
#    sql = 'SELECT id,during_time FROM red_packets WHERE category = 2 AND slot = 0 ORDER BY created_at'
#    DrhModels::RedPacket.find_by_sql(sql).each_with_index do |p_redpacket,index|
#      if index.to_i < 2
#        # 手工开启的红包，前两个半小时开启
#        result = Drhbo::Common::RedPacket.get_slot_and_find_start(30*60)
#      else
#        # 后面的还是依照默认规则进行开启
#        result = Drhbo::Common::RedPacket.get_slot_and_find_start
#      end
#      DrhModels::RedPacket.update(p_redpacket.id,
#        :find_start     =>result[:find_start],
#        :find_stop      =>result[:find_start].to_i + p_redpacket.during_time,
#        :slot           =>result[:slot]
#      )
#    end
#    # 设置全局开关
#    Drhbo::WEB_REDIS.SET('redpacket.hold',0)

#----------------------------------------------------------------------

#      image_num = DrhModels::AsyncImage.count(:conditions =>["reference_id=? and category=?",0,DrhModels::AsyncImage::CAT_EDITOR])
#      if image_num > 1
#        DrhModels::AsyncImage.find(:all,
#          :conditions =>["reference_id=? and category=?",0,DrhModels::AsyncImage::CAT_EDITOR],
#          :order => "created_at").each_with_index do |image,index|
#          #正好最后一个不删除
#          unless image_num == index.to_i + 1
#            # 删除旧的对应关系和图片
#            LOGGER.info("delete async_image id:#{image.id}")
#            image.delete()
#            dir = get_dir(image.id, ImageConfig::EDITOR_IMAGE_ROOT)
#            # 删除原图
#            imgdir = File.join(dir, image.id.to_s+'*')
#            File.delete(*Dir.glob(imgdir))
#            LOGGER.info("delete images :#{imgdir}")
#          end
#        end
#      end

#----------------------------------------------------------------------

#    sql = 'SELECT item1_id,item2_id,item3_id FROM recommend_themes WHERE page = ? AND order_num = ? AND is_preview = 1'
#    recommend_theme =  DrhModels::RecommendTheme.find_by_sql([sql,1,1])[0]
#    result =[recommend_theme.item1_id,recommend_theme.item2_id,recommend_theme.item3_id]
#    p result

#----------------------------------------------------------------------


#url = '%'+'http://www.darenhui.com/item/100006932/out_review?ref=wel-083_6-iImg&haveERP=1'+'%'
#red_packet = DrhModels::RedPacket.find(:first,:conditions=>['candidates like ?',url])
#p red_packet

#reduce_second = -1200
#
#DrhModels::RedPacket.update_all(
#  ['find_start = find_start - ? ,find_stop = find_stop - ?',reduce_second,reduce_second],
#  ['find_stop is not null AND category = 2 AND finder is null AND slot = ? AND find_stop >?',2,Time.now.to_i])


#----------------------------------------------------------------------

#red_packet_id = 5
#
#p DrhModels::RedPacket.find(red_packet_id,:select=>'sponsor,category')

#----------------------------------------------------------------------

# p DrhModels::RedPacket.count(:select=>'id', :conditions=>'finder is null') >= 18