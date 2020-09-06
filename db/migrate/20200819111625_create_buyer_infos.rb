class CreateBuyerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_infos do |t|
      t.references :item ,null: false, foreign_key: true
      t.string :postal_code, null: false
      t.integer :shipping_region_id, null: false
      t.string :city, null: false
      t.string :address, null: false 
      t.string :building_name
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
