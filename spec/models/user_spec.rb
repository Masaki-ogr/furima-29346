require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき'  do
      it "nicknameとemail、password、password_confirm、family_name、first_name、family＿name_kana、first_name_kana、birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
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
      it "passwordが半角英数混合でないと登録できない" do
        @user.password = "PASSWORD"
        @user.password.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_name、first_nameが空だと登録できない" do
        @user.family_name = ""
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "First name can't be blank")
      end
      it "family_name、first_nameが全角でないと登録できない" do
        @user.family_name = "Yamada"
        @user.first_name = "Taro"
        @user.family_name.match(/\A[ぁ-んァ-ヶ一-龥々]+\z/)
        @user.first_name.match(/\A[ぁ-んァ-ヶ一-龥々]+\z/)
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid", "First name is invalid")
      end
      it "family_name_kana、first_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "First name kana can't be blank")
      end
      it "family_name_kana、first_name_kanaが全角カタカナでないと登録できない" do
        @user.family_name_kana = "Yamada"
        @user.first_name_kana = "Taro"
        @user.family_name_kana.match(/\A[ァ-ヶー－]+\z/)
        @user.first_name_kana.match(/\A[ァ-ヶー－]+\z/)
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name kana is invalid", "First name kana is invalid")
      end
      it "birthが空だと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
