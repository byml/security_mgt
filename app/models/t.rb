require 'rest-client'

class T
  def self.get(url, params)
    RestClient.get  url, {:params => params}
  end

  def self.abc
	  require "execjs"
		require "open-uri"

		source = open("http://stock.jrj.com.cn/ipo/ipo2015/newStockList.js").read.force_encoding('UTF-8')

		context = ExecJS.compile(source)
		context.eval('nsiList')

  end
end