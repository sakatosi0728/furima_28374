require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "family_nameは数値だと登録できない" do
      @user.family_name = '1234567890'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "first_nameは数値だと登録できない" do
      @user.first_name = '1234567890'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "family_name_kanaはカタカナしか登録できない" do
      @user.family_name_kana = 'カナ'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "first_name_kanaはカタカナしか登録できない" do
      @user.first_name_kana = 'カナ'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "emailは@を含む必要がある" do
     @user.email = '@'
     @user.valid?
     expect(@user.errors.full_messages).to include()
    end
    it "メールアドレスが一意性である必要がある" do
     @user.email 
     @user.valid?
     expect(@user.errors.full_messages).to include()
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end