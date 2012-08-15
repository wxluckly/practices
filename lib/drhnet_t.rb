require 'rubygems'
require 'thread'
require 'drhdao'
require 'drhbo'
require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'cgi'
require 'curb'
require 'drhdao'

@@curl = Curl::Easy.new

item_id = 100009446

    # 删除“大家正在看”队列中的数据
    Drhbo::WEB_REDIS.lrem("stat.female_users_now_looking_items.list", 0, item_id )
    Drhbo::WEB_REDIS.lrem("stat.male_users_now_looking_items.list", 0, item_id )
    Drhbo::WEB_REDIS.lrem("stat.users_now_looking_items.list", 0, item_id )
    # 删除“最受大家喜欢”队列中的数据
    Drhbo::WEB_REDIS.lrem("stat.female_users_most_like_items.list", 0, item_id )
    Drhbo::WEB_REDIS.lrem("stat.male_users_most_like_items.list", 0, item_id )
    Drhbo::WEB_REDIS.lrem("stat.users_most_like_items.list", 0, item_id )
    # 删除访问列表
    Drhbo::WEB_REDIS.del("item:"+item_id.to_s+":last_visit_users.list")
    # 删除访问人数
    Drhbo::WEB_REDIS.hdel(Drhdao::DrhRedis::STAT_ITEM_PV_COUNT_HASH_KEY, item_id)
    # 删除mahout推荐对象中的产品信息
#    sql = 'SELECT * FROM mix_behaviors WHERE item_id = ?'
#    DrhModels::MixBehavior.find_by_sql([sql,item_id]).each_with_index do |behavior,index|
#      begin
#        @@curl.timeout = 5
#        @@curl.max_redirects = 1
#        @@curl.url = Drhdao::DrhConfig::MAHOUT_SERVER_DOMAIN.to_s+'/mahout-http-service/reference'
#        @@curl.http_post(
#          Curl::PostField.content('itemID', item_id),
#          Curl::PostField.content('userID', behavior.user_id),
#          Curl::PostField.content('actType', "unview")
#        )
#      rescue Exception => e
##        LOGGER.error(e.message+"\n"+e.backtrace.join("\n"))
##        DrhdbLog.error(DrhModels::WebError::ProjectId::DRHBO, __FILE__, __method__, __LINE__,e, nil)
#      end
#      sleep(2)
#    end
    # 删除“看了的还在看”缓存在item_stats中的数据，需要在mahout处理之后进行运行
    sql = 'SELECT id,related_viewed_item_ids,related_viewed_item_num FROM item_stats WHERE related_viewed_item_ids LIKE "%?%"'
    DrhModels::ItemStat.find_by_sql([sql,item_id]).each do |item_stat|
      array = item_stat.related_viewed_item_ids.split(",")
      array.delete(item_id.to_s)
      related_viewed_item_ids = array.join(",")
      related_viewed_item_num = array.size()
      DrhModels::ItemStat.update(item_stat.id,:related_viewed_item_num=>related_viewed_item_num,:related_viewed_item_ids=>related_viewed_item_ids)
    end
p "all done"



#----------------------------------------------------------------------


#@access_token = 'A9A71532C628557246C0F3BEEB5D870E'
#@open_id = 'D671185AF907813F5ECFB7F9BB9E3693'
#content = 'faewgaewgwaeg'
#image_url = nil
#
#href_url = 'http://www.darenhui.com'
#    # 官方文档说需要对内容encode一下，但是测试发现encode后乱码，不encode反而正常
#    status = content.scan(/./)[0, 140].join('')
#    params = {
#      'access_token'=>@access_token,
#      'open_id'=>@open_id,
#      'oauth_consumer_key'=>'100258260',
#      'title'=>status,
#      'url'=>href_url,
#      'images'=>image_url
#    }
#    url = URI.parse('https://graph.qq.com/share/add_share')
#    http = Net::HTTP.new(url.host, url.port)
#    http.use_ssl = true
#    req = Net::HTTP::Post.new(url.path)
#    req.set_form_data(params)
#    result = JSON.parse(http.request(req).body)
##    if result['error_code']
##      Drhbo::WEB_REDIS.hset("user:"+user_id.to_s+":news", "qq_zone_access_token_expired" , 1) if result['ret'].to_i == 100030
##      Rails.logger.error(result)
##    end
#   p result

#----------------------------------------------------------------------

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