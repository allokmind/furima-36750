class OrderAddress

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Exclude hyphen(-)"}
    validates :order_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end

  def save
     order = Order.create(user_id: user_id, item_id: item_id)
     Address.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end