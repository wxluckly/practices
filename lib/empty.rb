def get_params_value(p_str)
  str = p_str.strip
  str = nil if str.empty?
  return str
end

a = " "

#p a.empty?

p get_params_value("  gae wrg ")

