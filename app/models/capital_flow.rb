class CapitalFlow < ActiveRecord::Base
  belongs_to :account_info
  belongs_to :business_type
  belongs_to :security_info
end
