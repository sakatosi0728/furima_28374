class Buyer
  
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_region_id
    validates :city
    validates :address
    validates :phone_number, format: {with:/\A\d{11}\z/}
    validates :token
  end

  def save
    Order.create(item_id: item_id, user_id: user_id)
    BuyerInfo.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_id: item_id )
  end
end