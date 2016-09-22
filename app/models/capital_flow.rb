class CapitalFlow < ActiveRecord::Base
  belongs_to :account_info
  belongs_to :business_type
  belongs_to :security_info

  #查询成交过的股票id列表
  def self.get_traded_security_info_ids
  	where('security_info_id IS NOT NULL').select(:security_info_id).distinct().pluck(:security_info_id)
  end
end
