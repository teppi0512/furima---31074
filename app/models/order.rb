class Order

  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_cord, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input full-width characters"}, length: { maximum: 11 }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    PurchaseUser.create(postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end

