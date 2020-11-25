class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
  validates :name
  validates :explain
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :price, format:{ with:/\A[0-9]+\z/, message: "is invalid. Input full-width characters."}, :numericality => { :less_than => 9999999, :greater_than => 299 }
  validates :image
  end


  with_options presence: true, numericality: { other_than: 1 } do
  validates :category_id
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :scheduled_delivery_id
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery


end
