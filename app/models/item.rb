class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :name
  validates :explain
  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :price, format:{ with:/\A[0-9]+\z/, message: "is invalid. Input full-width characters."}, :numericality => { :less_than => 9999999, :greater_than => 300 }
  validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery


end
