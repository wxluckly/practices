

require 'rubygems'
require "RMagick"
require 'drhdao'
require 'drhweb_service'

LETTER_HEIGHT = 38

merchant_user_id = 100000102

cost_num = '10'

reduce_num = '1'

money_num = '10.0'

user = DrhModels::User.find(merchant_user_id,:select=>'head_image_id')
bg = Magick::Image.new(335,190,Magick::GradientFill.new(0, 0, 335, 190, "#FFFEEF", "#FFFEEF"))
img_brp = Magick::Image.read(DrhwebService::LinkService.static("images/redpacket/redbox_03.png")).first
chinese_text = Magick::Image.read(DrhwebService::LinkService.static("images/redpacket/chinese_text.gif")).first
img_logo = Magick::Image.read(DrhwebService::LinkService.static(DrhwebService::ImageService.get_image_url(user.head_image_id, DrhwebService::ImageService::HEAD_S5))).first
img_logo = img_logo.resize_to_fit(140)
final = bg.dissolve(img_logo, 1, 1, 97.5, 125)
img_logo = img_logo.resize_to_fit(100)
final = final.dissolve(img_logo, 0.5, 1, 10, 30)
final = final.dissolve(img_logo, 0.5, 1, 222, 30)
final = final.dissolve(img_logo, 0.5, 1, 30, 80)
final = final.dissolve(img_logo, 0.5, 1, 202, 80)
final = final.dissolve(img_brp, 1, 1, 112, 10)
font_bg_width = 114 + money_num.length*13
font_bg = Magick::Image.new(font_bg_width,30,Magick::HatchFill.new('red','red'))
x_position =  (335 - font_bg_width)/2
final = final.composite(font_bg, x_position, 66, Magick::MultiplyCompositeOp)
final = final.composite(chinese_text, x_position+money_num.length*13+7, 76, Magick::MultiplyCompositeOp)
gc = Magick::Draw.new
gc.stroke('transparent')
gc.pointsize(25)
gc.font_weight(700)
gc.fill('white')
gc.font("fonts/arial.ttf")
gc.text(x_position+2,90,money_num)
gc.pointsize(32)
gc.draw(final)





#    user = DrhModels::User.find(merchant_user_id,:select=>'head_image_id')
#    img_bg = Magick::Image.read(DrhwebService::LinkService.static("images/coupon/original.jpg")).first
#    img_logo = Magick::Image.read(DrhwebService::LinkService.static(DrhwebService::ImageService.get_image_url(user.head_image_id, DrhwebService::ImageService::HEAD_S5))).first
#    img_cost = Magick::Image.read(DrhwebService::LinkService.static("images/coupon/cost.jpg")).first
#    img_reduce = Magick::Image.read(DrhwebService::LinkService.static("images/coupon/reduce.jpg")).first
#    img_coupon = Magick::Image.read(DrhwebService::LinkService.static("images/coupon/coupon.gif")).first
#    img_logo = img_logo.resize_to_fit(140)
#    final = img_bg.dissolve(img_logo, 0.7, 1, 20, 95)
#    final = final.dissolve(img_coupon, 0.7, 1, 113, 72)
#    p1 = (181-(16+16+17*cost_num.length+20*reduce_num.length))/2
#    p2 = p1+16
#    p3 = p2+17*cost_num.length
#    p4 = p3+16
#    final = final.composite(img_cost, p1, LETTER_HEIGHT, Magick::MultiplyCompositeOp)
#    gc = Magick::Draw.new
#    gc.stroke('transparent')
#    gc.pointsize(28)
#    gc.font_weight(700)
#    gc.fill('red')
#    gc.font("fonts/arial.ttf")
#    gc.text(p2,LETTER_HEIGHT+14,cost_num)
#    final = final.composite(img_reduce, p3, LETTER_HEIGHT, Magick::MultiplyCompositeOp)
#    gc.pointsize(32)
#    gc.text(p4,LETTER_HEIGHT+14,reduce_num)
#    gc.draw(final)



image = final.to_blob
