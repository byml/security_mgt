class CreateSecurityPriceHistories < ActiveRecord::Migration
  def change
    create_table :security_price_histories do |t|
      t.references :security_info,    :null => false
      t.date :trade_date,             :null => false
      t.decimal :open,    :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal :close,   :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal :high,    :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal :low,     :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal :volume,  :null => false, :precision => 16, :scale => 2, :default => 0
      t.decimal :amount,  :null => false, :precision => 16, :scale => 2, :default => 0

      t.timestamps null: false
    end
  end
end
