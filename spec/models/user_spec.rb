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
        expect(@user.errors.full_messages).to include( "Nickname can't be blank" )
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Email can't be blank" )
      end
      it "emailに@がないと登録できない" do
        @user.email = "sample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Email is invalid" )
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include( "Email has already been taken" )
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password can't be blank" )
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is too short (minimum is 6 characters)" )
      end
      it "半角英字のみでは登録できない" do
        @user.password = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid" )
      end
      it "半角数字のみでは登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid" )
      end
      it "全角では登録できない" do
        @user.password = "PASSWORD"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid" )
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password confirmation doesn't match Password" )
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name can't be blank" )
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name can't be blank" )
      end
      it "family_nameが全角でないと登録できない" do
        @user.family_name = "Yamada"
        @user.family_name.match(/\A[ぁ-んァ-ヶ一-龥々]+\z/)
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name is invalid" )
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = "Taro"
        @user.first_name.match(/\A[ぁ-んァ-ヶ一-龥々]+\z/)
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name is invalid" )
      end
      it "first_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name kana can't be blank" )
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name kana can't be blank" )
      end
      it "family_name_kanaが全角カタカナでないと登録できない" do
        @user.family_name_kana = "Yamada"
        @user.family_name_kana.match(/\A[ァ-ヶー－]+\z/)
        @user.valid?
        expect(@user.errors.full_messages).to include( "Family name kana is invalid" )
      end
      it "first_name_kanaが全角カタカナでないと登録できない" do
        @user.first_name_kana = "Taro"
        @user.first_name_kana.match(/\A[ァ-ヶー－]+\z/)
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name kana is invalid" )
      end
      it "birthが空だと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include( "Birth can't be blank" )
      end
    end
  end
end
