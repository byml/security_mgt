class CreateCapitalFlows < ActiveRecord::Migration
  def change
    create_table :capital_flows do |t|
      t.references  :account_info,    index: true, foreign_key: true
      t.references  :business_type,   index: true, foreign_key: true
      t.references  :security_info,   index: true
      t.date        :trade_date,      :null => false
      t.decimal     :trade_price,     :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal     :trade_quantity,  :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal     :amount,          :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal     :balance,         :null => false, :precision => 16, :scale => 2, :default => 0
      t.string      :remarks

      t.timestamps null: false
    end
  end
end
