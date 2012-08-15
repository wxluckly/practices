# To change this template, choose Tools | Templates
# and open the template in the editor.

#取得所有erb文件
rbfiles = File.join("D:/views/**", "*.erb")
#依次浏览文件
Dir.glob(rbfiles).each do |file|
  file_path = file.dup
  after_file_path = file.to_s.insert(8, '2')
  fixed_file = File.new(after_file_path,"w")
  #依次打开文件
  File.open(file_path) do |file_o|
    file_o.each_line do |line_o|
      reg = /src="\/images[^'"]+/i
      line_o = line_o.gsub(reg) { |match|
        match[5,1]= ''
        match.insert(5, '<%=su("') + '")%>'
      }
      fixed_file.puts line_o.to_s
    end
    fixed_file.close
    p file_path + "done"
  end
end
p "all done sir"


#p 'hello_word'.include?('or')



#def high_light_str(str)
#  str = str.gsub("(em)","<font color=red>")
#  str = str.gsub("(/em)","</font>")
#  return str
#end
#
#
#
#
#str = "(em)王鑫龙(/em)"
#p  str
#
#
#p high_light_str(str)


#p 'wxluckly@gmail1.com'.hash()

#p '中文'

#
#content = 'faegehttp://fjaoegj.com.afenogea/faejogi中文/的减肥哦'
#link_reg = %r{(http://[a-zA-Z_0-9./%]+)}imu
#p "correct: #{$1}" if content =~ link_reg


#a = [1,2,3,4]
#
#a.each_with_index do |i,index|
#  if index < 2
#    next
#  end
#  p a[index]
#
#end



#url='hteioa?id=113&if?id=312&'
#page_num_reg = Regexp.new("(^|)id=([^&]*)(|$)")
#str = url.match(page_num_reg)
#if str
#  p str[2].to_i
#else
#  p ''
#end
#
#
#
#animals = %w( ant bee cat dog elk)
#animals.each { |animal| puts animal }
#puts "我是中文"
