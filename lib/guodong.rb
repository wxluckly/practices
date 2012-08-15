require 'rubygems'
#require 'drhdao'
require 'drhbo'
#require 'drhlog'
#@@logger = DrhLogger.of("service")
p 'init darenhui user begin....'

ActiveRecord::Base.logger = DrhLogger.of("service")
user_data_hash = {
  :id                 =>DrhModels::User::DARENHUI_ID,
  :register_email     =>'no-reply@darenhui.com' ,
  :nick_name          => '达人小精灵',
  :passwd             => Drhbo::Tool.md5('darenhui'),
  :real_name          => '达人小精灵',
  :is_verified        => true,
  :gender             => false,
  :birthday           =>Time.now,
  :star_sign          =>1,
  :province           =>3,
  :city               =>305,
  :proclamation       =>'我是达人汇官方小精灵',
  :profession         =>33,
  :school             =>'北京大学',
  :corporation        =>'达人汇',
  :current_step       => DrhModels::User::STEP_HAVE_FACE,
  :register_email_code=>Drhbo::Tool::str_to_int('no-reply@darenhui.com'),
  :nick_name_code     => Drhbo::Tool.str_to_int('达人汇'),
  :role_id            =>1,
  :category           =>DrhModels::User::CAT_ADMIN,
  :is_frozed          => false,
  :register_ip        => '127.0.0.1',
  :last_ip            => '127.0.0.1',
  :invite_by          =>nil,
  :email_verified     =>true
  #activate_code
  #activate_code_created_at
  #findpass_code
  #findpass_code_created_at
  # :head_image_id=>3
  #style_image_1
  #style_image_2
  #style_image_3
}
user = DrhModels::User.create(user_data_hash)
DrhModels::UserStat.update_all(['wealth=1000000'], ['user_id=?', user.id])

p 'init darenhui user end....'
