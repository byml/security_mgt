require 'rest-client'

class SecurityPriceHistory < ActiveRecord::Base
  belongs_to :security_info

  URL_SH_AND_SZ = 'http://123.57.249.182:8080/URL/Api/ApiInterface.ashx?apikey=3960f9e2bdf438e80d04e7637d2e6f7a&flag=histData'

  def self.record_history(security_info, response)
    if response.code == 200
      result = JSON.parse(response.body)
      if result['rows'].size > 0
        security_price_history = SecurityPriceHistory.new(result['rows'][0].slice('trade_date','open','close','high','low','volume'))
        security_price_history.security_info = security_info
        security_price_history.save
      end
    end
    security_price_history
  end

  def self.query_and_record_history(security_info, trade_date)
    security_price_history = SecurityPriceHistory.find_by(security_info: security_info, trade_date: trade_date)
    if security_price_history.nil?
      url = get_query_url(security_info.market.code)
      params = {date: trade_date, code: security_info.trade_code}
      response = RestClient.get(url, {:params => params})
      security_price_history = record_history(security_info, response)
    end
    security_price_history
  end

  def self.query_and_record_histories(security_infos, trade_date)
    security_infos.each do |security_info|
      query_and_record_history(security_info, trade_date)
    end
  end

  def self.query_and_record_histories_in_range(security_infos, from_date, to_date)
    from_date = Date.parse(from_date) if 'String' == from_date.class.name
    to_date = Date.parse(to_date) if 'String' == to_date.class.name
    (from_date..to_date).each do |trade_date|
      query_and_record_histories(security_infos, trade_date)
    end
  end

  def self.get_query_url(market_code)
    if 'sh' == market_code  || 'sz' == market_code
      url = URL_SH_AND_SZ
    end
    url
  end
end
