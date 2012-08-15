require 'rubygems'
require 'drhdao'
sql = 'select id,standard_list from brand_repositories order by id'
brands = DrhModels::BrandRepository.find_by_sql(sql)
brands.each do |brand|
  brand.standard_list.split(",").each do |i|
    unless DrhModels::BrandRepository.find(:first,:conditions=>['id=?',i],:select=>'id')
      p '！～～～～～～～～～～我在第'+brand.id.to_s+'条发现没找到！'
      break
    end
  end
  #运行一百条睡一秒
  if brand.id % 100 == 1
    p '完成'+brand.id.to_s+'了'
    sleep(1)
  end
end
p 'all done sir'



