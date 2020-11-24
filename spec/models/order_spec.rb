require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: seller.id)
    @order = FactoryBot.build(:order, item_id: item.id, user_id: buyer.id)

  end

  describe 'ユーザー新規登録' do
    context '購入がうまくいくとき' do
      it "postal_cord,prefecture_id,city,addresses,phone_numberが存在すれば登録できる" do
        expect(@order).to be_valid
      end

      it'建物名が空でも購入できる' do
        @order.building = nil
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

      it "prefecture_idが0だと登録できない" do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
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

      it "phone_numberに-などの数字以外の文字が含まれている場合購入できない" do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input full-width characters")
      end

      it "phone_numberが12桁以上の場合購入できない" do
        @order.phone_number = '0901234567890'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it "tokenが空の場合購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

    end
  end

end