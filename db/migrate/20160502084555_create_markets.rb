class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
