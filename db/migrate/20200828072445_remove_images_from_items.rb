class RemoveImagesFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :images, :string
  end
end
