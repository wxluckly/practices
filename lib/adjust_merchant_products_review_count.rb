#@author: wangxinlong
#@description: adjust merchant_product's review_count
#@created date: 2012-04-17
require 'rubygems'
require 'thread'
require 'drhdao'

class AdjustMerchantProductsReviewCount

  # 修正评论的数量
  def self.process()
    i, step, max, count = 100000000, 3000, 101406980, 0
    while i < max
      p "now processing merchant_product id: #{i} to #{i+step}"
      DrhModels::MerchantProduct.find(:all,:select=>"id,merchant_id,product_id,review_count", :conditions=>["id>=? and id<=?",i, i+step]).each do |merchant_product|
        currect_num = DrhModels::MerchantProductReview.count(:conditions=>[" merchant_id = ? AND product_id = ?",merchant_product.merchant_id,merchant_product.product_id])
        if merchant_product.review_count != currect_num
          DrhModels::MerchantProduct.update(merchant_product.id,:review_count=>currect_num)
          count += 1
          p "[#{merchant_product.merchant_id},#{merchant_product.product_id}] adjust merchant_product_id: #{merchant_product.id} adjustment_count: #{count}"
        end
      end
      sleep 3
      i += step
    end
  end

  private

  def self.truncate(str, length)
    str.strip! if str
    if str and str.length>0
      str = str.mb_chars
      str = str.length > length ? str[0,length]+"..." : str[0, length]
    end
    str.to_s
  end

  def self.hc(str)
    str = Zlib.crc32(str) if str.is_a?(String)
    str
  end

end



AdjustMerchantProductsReviewCount.process()












