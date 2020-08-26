class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :shipping_region_id
    validates :days_until_shipping_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
