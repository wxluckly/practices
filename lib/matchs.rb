

#p '中国人'.match(/2国人/)

MERCHANT_NAME = [
  '达人汇',
  '京东',
  '新蛋',
  '凡客',
  '缪诗',
  '乐淘',
  '梦芭莎',
  '耀点100',
  '左岸女人',
  '麦包包',
  '麦考林',
  '易迅'
]

def is_illegal_name(new_name)
  MERCHANT_NAME.each do |name|
    if new_name.scan(/^#{name}/) != []
      return true
    end
  end
  return false
end

#s = '中人'
#p '中国人'.scan(/^#{s}/)

p is_illegal_name('耀点200分·')



