require 'rubygems'
require "RMagick"
require 'drhdao'
require 'drhweb_service'

LETTER_HEIGHT = 28

merchant_user_id = 100000117
yuan_num = "100"
user = DrhModels::User.find(merchant_user_id,:select=>'head_image_id')
img_bg = Magick::Image.read("C:/images/coupon/original_for_giftcard.png").first
img_logo = Magick::Image.read(DrhwebService::LinkService.static(DrhwebService::ImageService.get_image_url(user.head_image_id, DrhwebService::ImageService::HEAD_S5))).first
img_yuan = Magick::Image.read("C:/images/coupon/yuan.gif").first
img_giftcard = Magick::Image.read("C:/images/coupon/giftcard.gif").first
img_logo = img_logo.resize_to_fit(140)
final = img_bg.dissolve(img_logo, 0.7, 1, 20, 95)
final = final.dissolve(img_giftcard, 0.7, 1, 113, 72)
p1 = (181-(60+18*yuan_num.length))/2
p2 = p1+17*yuan_num.length
gc = Magick::Draw.new
gc.stroke('transparent')
gc.pointsize(30)
gc.font_weight(700)
gc.fill('yellow')
gc.font("fonts/arial.ttf")
gc.text(p1,LETTER_HEIGHT+23,yuan_num)
gc.draw(final)
final = final.composite(img_yuan, p2, LETTER_HEIGHT, Magick::LightenCompositeOp)
#image = final.to_blob
final.write("C:/rmagictest/final.jpg")
p "done"


# ----------------------------------------------------------------------------------------

# 生成红包：

#merchant_user_id = 100000119
#money_num = '5150'
#user = DrhModels::User.find(merchant_user_id,:select=>'head_image_id')
#img_bg = Magick::Image.new(335,190,Magick::GradientFill.new(0, 0, 335, 190, "#FFFEEF", "#FFFEEF"))
#img_brp = Magick::Image.read("C:/rmagictest/redbox_03.png").first
#chinese_text = Magick::Image.read("C:/rmagictest/chinese_text.gif").first
##img_logo = Magick::Image.read("C:/rmagictest/logo.jpg").first
#img_logo = Magick::Image.read(DrhwebService::LinkService.static(DrhwebService::ImageService.get_image_url(user.head_image_id, DrhwebService::ImageService::HEAD_S5))).first
#
#img_logo = img_logo.resize_to_fit(140)
#final= img_bg
#final = final.dissolve(img_logo, 1, 1, 97.5, 125)
#img_logo = img_logo.resize_to_fit(100)
#final = final.dissolve(img_logo, 0.5, 1, 10, 30)
#final = final.dissolve(img_logo, 0.5, 1, 222, 30)
#final = final.dissolve(img_logo, 0.5, 1, 30, 80)
#final = final.dissolve(img_logo, 0.5, 1, 202, 80)
#final = final.dissolve(img_brp, 1, 1, 112, 10)
#font_bg_width = 114 + money_num.length*13
#font_bg = Magick::Image.new(font_bg_width,30,Magick::HatchFill.new('red','red'))
#x_position =  (335 - font_bg_width)/2
#final = final.dissolve(font_bg, 1, 1, x_position, 66)
#final = final.dissolve(chinese_text, 1, 1, x_position+money_num.length*13+7, 76)
#gc = Magick::Draw.new
#gc.stroke('transparent')
#gc.pointsize(25)
#gc.font_weight(700)
#gc.fill('white')
#gc.font("fonts/arial.ttf")
#gc.text(x_position+2,90,money_num)
#gc.pointsize(32)
#gc.draw(final)
#final.write("C:/rmagictest/final.jpg")

#p 'good'

# ----------------------------------------------------------------------------------------

#merchant_user_id = 100000118
#LETTER_HEIGHT = 38
#merchant_user_id = 100000118
#cost_num = '111'
#reduce_num = '22'
#user = DrhModels::User.find(merchant_user_id,:select=>'head_image_id')
#img_bg = Magick::Image.read("C:/images/original.jpg").first
#img_logo = Magick::Image.read(DrhwebService::LinkService.static(DrhwebService::ImageService.get_image_url(user.head_image_id, DrhwebService::ImageService::HEAD_S5))).first
#img_cost = Magick::Image.read("C:/images/cost.jpg").first
#img_reduce = Magick::Image.read("C:/images/reduce.jpg").first
#img_coupon = Magick::Image.read("C:/images/coupon.gif").first
#img_logo = img_logo.resize_to_fit(140)
#final = img_bg.dissolve(img_logo, 0.7, 1, 20, 95)
#final = final.dissolve(img_coupon, 0.7, 1, 113, 72)
#p1 = (181-(16+16+17*cost_num.length+20*reduce_num.length))/2
#p2 = p1+16
#p3 = p2+17*cost_num.length
#p4 = p3+16
#final = final.composite(img_cost, p1, LETTER_HEIGHT, Magick::MultiplyCompositeOp)
#gc = Magick::Draw.new
#gc.stroke('transparent')
#gc.pointsize(28)
#gc.font_weight(700)
#gc.fill('red')
#gc.font("fonts/arial.ttf")
#gc.text(p2,LETTER_HEIGHT+14,cost_num)
#final = final.composite(img_reduce, p3, LETTER_HEIGHT, Magick::MultiplyCompositeOp)
#gc.pointsize(32)
#gc.text(p4,LETTER_HEIGHT+14,reduce_num)
#gc.draw(final)
#
#final.write("C:/images/final.jpg")

