class CreateRightsIssues < ActiveRecord::Migration
  def change
    create_table :rights_issues do |t|  
    	t.string :category	
      t.string :ref_security_code
      t.string :trade_code
      t.string :name

      t.timestamps null: true
    end
  end
end