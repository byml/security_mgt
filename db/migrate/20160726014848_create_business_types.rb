class CreateBusinessTypes < ActiveRecord::Migration
  def change
    create_table :business_types do |t|
      t.string :code
      t.string :name
      t.string :alias_names

      t.timestamps null: false
    end
  end
end
