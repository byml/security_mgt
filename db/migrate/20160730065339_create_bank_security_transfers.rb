class CreateBankSecurityTransfers < ActiveRecord::Migration
  def change
    create_table :bank_security_transfers do |t|
      t.references :account_info, index: true, foreign_key: true
      t.references :business_type, index: true, foreign_key: true
      t.date :trade_date, :null => false
      t.decimal :amount, :null => false, :precision => 16, :scale => 2

      t.timestamps null: false
    end
  end
end
