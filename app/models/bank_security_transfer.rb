class BankSecurityTransfer < ActiveRecord::Base
  belongs_to :account_info
  belongs_to :business_type
end
