class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :user_id, foreign_key: true
      t.references :buyer_id, foreign_key: true
      t.refefences :buyer_info_id, foreign_key: true
      t.timestamps
    end
  end
end