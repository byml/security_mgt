class CreateSecurityInfos < ActiveRecord::Migration
  def change
    create_table :security_infos do |t|
      t.string :code
      t.string :trade_code
      t.string :name
      t.references :market, index: true, foreign_key: true
      t.date :listing_date
      
      t.timestamps null: false
    end
  end
end
