class CreateBuyerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_infos do |t|

      t.timestamps
    end
  end
end
