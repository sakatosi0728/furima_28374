class Item < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :shipping_region_id, presence: true
  validates :days_until_shipping_id, presence: true
  validates :price, presence: true
end
