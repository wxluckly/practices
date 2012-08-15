a = "123好21’"



##将文件1的中英文进行位置对调，存储到文件2中
file_path = "c:/rawtext.txt"
file = File.open(file_path)
fix_file = File.open("c:/rawtext2.txt","w")
file.each_line do |line|
  #  reg = /[^\s\da-zA-Z&\.﻿\-－'é:‘!’\/0-9]+/i
  reg = /[\x80-\xff]/i
  position = line.index(reg)
  if position
    str = line[position,line.length].gsub("\n", " ") + " " + line[0,position]
    fixed_line = str
  else
    fixed_line = line
  end
  fixed_line = fixed_line.strip
  fixed_line.gsub!(/(\(\d+\))/,"")
  fixed_line.gsub!(/[\(\)（）]/," ")
  fixed_line.gsub!(/\s+/,' ')
  fix_file.puts fixed_line
end
p "all done sir"

