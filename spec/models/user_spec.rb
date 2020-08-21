require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "family_nameは数値だと登録できない"
      @user.family_name = '1234567890'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name can't be Numerical_value")
    end
    it "first_nameは数値だと登録できない"
      @user.first_name = '1234567890'
      @user.valid?
      expect(@user.errors.full_messages).to include("Farst_name can't be Numerical_value")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
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
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_name_kanaはカタカナしか登録できない"
      @user.family_name = 'カナ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name_kana can't be Numerical_value")
    end
    it "first_nameは数値だと登録できない"
      @user.first_name = 'カナ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Farst_name_kana can't be Numerical_value")
    end
  end
end