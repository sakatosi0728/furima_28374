class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :user_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.timestamps
    end
  end
end