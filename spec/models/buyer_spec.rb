require 'rails_helper'
RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end

  describe '商品出品機能' do
    it "郵便番号が空だと登録できない" do
      @buyer.postal_code = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Token can't be blank")
    end
    it "市区町村が空だと登録できない" do
      @buyer.city = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空だと登録できない" do
      @buyer.address = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が空だと登録できない" do
      @buyer.phone_number = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号は-を含む必要がある" do
      @buyer.postal_code = '-'
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end
    it "電話番号はハイフンが不要ある" do
      @buyer.phone_number = "09012345678"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end
    it "電話番号が9文字以下であれば登録できない" do
      @buyer.phone_number = "09012345678"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end
    it "トークンが空だと登録できない" do
      @buyer.token = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Token can't be blank")
    end
  end
end