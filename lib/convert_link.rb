def convert_link(url,key,value)
  key_reg = Regexp.new("(^|)"+ key +"=([^&]*)(|$)")
  tmp = key + "=" + value;
  if url.match(key_reg)
    return url.gsub(key_reg,tmp);
  else
    if(url.scan("[\?]"))
      return url + "&" + tmp;
    else
      return url + "?" + tmp;
    end
  end
end

p convert_link('http://www.dairuc.on?a=fae&c=fae','c','faewg')