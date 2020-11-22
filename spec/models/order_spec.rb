require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: seller.id)
    @order = FactoryBot.build(:order, item_id: item.id, user_id: buyer.id)

  end

  describe 'ユーザー新規登録' do
    context '出品がうまくいくとき' do
      it "postal_cord,prefecture_id,city,addresses,phone_numberが存在すれば登録できる" do
        expect(@order).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "postal_cordが空だと登録できない" do
        @order.postal_cord = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal cord can't be blank")
      end

      it "postal_cordに-がないとと登録できない" do
        @order.postal_cord = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal cord is invalid. Include hyphen(-)")
      end

      it "prefecture_idが空だと登録できない" do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと登録できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "addressesが空だと登録できない" do
        @order.addresses = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end

      it "phone_numberが空だと登録できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end

end