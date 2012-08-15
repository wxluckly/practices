require 'rubygems'
require 'thread'
require "spreadsheet"
require 'sys/uname'
require 'RMagick'
require 'drhdao'
require 'drhbo'

#图片上传相关参数
MESSAGE_IMAGE_ROOT = Sys::Uname.sysname.downcase.index("win") ?  "D:/Project_Ruby/image_service/public/images/user/" : "/local/static/images/user/"
QUALITY = 100
#同步素材存放位置
MainDir = Sys::Uname.sysname.downcase.index("win") ?  "c:/merchants/" : "/tmp/merchants/"

#获取文件夹路径
def get_dir(id, image_root)
  id = id.to_s
  dir = File.join(image_root, id[0...-7], id[-7..-4], '')
  FileUtils.makedirs(dir) unless File.exist?(dir)
  dir
end

Spreadsheet.client_encoding = "UTF-8"
book = Spreadsheet.open MainDir + "b2c.xls"
sheet1 = book.worksheet 0
str = ""
1.upto(100) do |i|
  merchant_name   = sheet1[i,0].to_s.strip
  break if merchant_name == ""


  str += "'"+merchant_name+"',"


  #  merchant_name   = sheet1[i,0].to_s.strip
  #  web_site        = sheet1[i,1].to_s.strip
  #  home            = sheet1[i,2].to_s.strip
  #  product         = sheet1[i,3].to_s.strip
  #  category        = sheet1[i,4].to_s.strip    #商家类别
  #  popularity_weight = sheet1[i,5].to_s.strip  #商家在该类别下的受欢迎权重
  #  introduction    = sheet1[i,6].to_s.strip
  #  return_days     = sheet1[i,7].to_s.strip
  #  is_support_cod  = sheet1[i,8].to_s.strip
  #  have_invoice    = sheet1[i,9].to_s.strip
  #  cs_phone        = sheet1[i,10].to_s.strip
  #  feature_service = sheet1[i,11].to_s.strip
  #  domain = web_site[11,web_site.length]
  #  if merchant_name != ""
  #    next if DrhModels::Merchant.find(:first,:conditions=>['name=?',merchant_name])
  #    #打开图像，如果没有图片，就报错停止
  #    dir = MainDir + domain + ".gif"
  #    full_image = Magick::Image.read(dir)
  #    user = nil
  #    async_image = nil
  #    #检查分类和分类受欢迎权重是否相等。如果不相等，跳出报错
  #    categories = category.split(",")
  #    category_nums = categories.length
  #    popularity_weights = popularity_weight.split(",")
  #    popularity_weight_nums = popularity_weights.length
  #    if category_nums != popularity_weight_nums
  #      p merchant_name+"的分类和分类权重个数无法对应，请检查"
  #      break
  #    end
  #    DrhModels::WebDbAr.transaction do
  #      #商家入库
  #      merchant = DrhModels::Merchant.create(
  #        :name           => merchant_name,
  #        :introduction   => introduction,
  #        :return_days    => return_days,
  #        :is_support_cod => is_support_cod.to_i,
  #        :have_invoice   => have_invoice.to_i,
  #        :cs_phone       => cs_phone,
  #        :feature_service=> feature_service
  #      )
  #
  #      #商家类别入库
  #      categories.each_with_index do |category,index|
  #        DrhModels::MerchantCategory.create(
  #          :merchant_id      => merchant.id,
  #          :category         => category,
  #          :created_at       => Time.now.to_i,
  #          :popularity_weight=> popularity_weights[index].to_i
  #        )
  #      end
  #
  #      #用户入库
  #      user = DrhModels::User.create(
  #        :nick_name        => merchant_name,
  #        :register_email   => "darenhui@"+domain,
  #        :passwd           => Drhbo::Tool.md5(domain),
  #        :real_name        => merchant_name,
  #        :gender           => 1,
  #        :is_verified      => 0,
  #        :register_email_code  => Drhbo::Tool.str_to_int("darenhui@"+domain),
  #        :nick_name_code   => Drhbo::Tool.str_to_int(merchant_name),
  #        :role_id          => 2,
  #        :category         => 2,
  #        :created_at       => Time.now.to_i
  #      )
  #      DrhModels::Merchant.update(merchant.id,:user_id => user.id)
  #
  #      #cps入库
  #      if home !=""
  #        DrhModels::MerchantCpsTemplate.create(
  #          :merchant_id  => merchant.id,
  #          :page_type    => 'home',
  #          :cps_link_template => home
  #        )
  #      end
  #      if product !=""
  #        DrhModels::MerchantCpsTemplate.create(
  #          :merchant_id  => merchant.id,
  #          :page_type    => 'product',
  #          :cps_link_template => product
  #        )
  #      end
  #
  #      #图片入库
  #      async_image = DrhModels::AsyncImage.create(
  #        :user_id      => user.id,
  #        :file_size    => full_image.size,
  #        :category     => DrhModels::AsyncImage::CAT_HEAD_IMAGE,
  #        :reference_id => user.id
  #      )
  #      DrhModels::User.update(user.id,:head_image_id => async_image.id)
  #    end
  #    #图片存储
  #    image = full_image.first
  #    image_message = image.clone
  #    new_dir = get_dir(user.id.to_s, MESSAGE_IMAGE_ROOT)
  #    #存储原始数据
  #    image.write(File.join(new_dir, async_image.id.to_s+'.jpg')){self.quality=QUALITY}
  #    #压缩至宽度150的状态，作为logo使用
  #    image.change_geometry!('150x150>') { |cols, rows, image| image.resize!(cols, rows)}
  #    image.write(File.join(new_dir, async_image.id.to_s+'-15054.jpg')){self.quality=QUALITY}
  #    #正方形大图片（150x150）
  #    height = image.rows.to_i
  #    adjust = (150 - height)/2
  #    image.border!(0,adjust,'rgb(255,255,255)')
  #    image.write(File.join(new_dir, async_image.id.to_s+'-150150.jpg')){self.quality=QUALITY}
  #    #80x80
  #    image.change_geometry!('80x80>') { |cols, rows, image| image.resize!(cols, rows)}
  #    image.write(File.join(new_dir, async_image.id.to_s+'-8080.jpg')){self.quality=QUALITY}
  #    #60x60
  #    image.change_geometry!('60x60>') { |cols, rows, image| image.resize!(cols, rows)}
  #    image.write(File.join(new_dir, async_image.id.to_s+'-6060.jpg')){self.quality=QUALITY}
  #    #商家评论信息图(130x180)
  #    image_message.change_geometry!('130x130>') { |cols, rows, image| image_message.resize!(cols, rows)}
  #    height = image_message.rows.to_i
  #    adjust = (180 - height)/2
  #    image_message.border!(0,adjust,'rgb(255,255,255)')
  #    image.write(File.join(new_dir, async_image.id.to_s+'-130180.jpg')){self.quality=QUALITY}
  #
  #    p merchant_name + ' is done'
  #  else
  #    break
  #  end
end
p str
p "all done sir"