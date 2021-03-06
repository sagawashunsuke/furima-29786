require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "名字が入力されていれば次に進める" do
        @user.family_name = "山田"
        expect(@user).to be_valid
      end
      it "名前が入力されていれば次に進める" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "名字(カナ)が入力されていれば次に進める" do
        @user.family_name = "ヤマダ"
        expect(@user).to be_valid
      end
      it "名前(カナ)が入力されていれば次に進める" do
        @user.first_name = "タロウ"
        expect(@user).to be_valid
      end
      it "生年月日が入力されていれば次に進める" do
        @user.birth_day = "20200101"
        expect(@user).to be_valid
      end
      it "emailは@を含む必要がある" do
        @user.email = "aaa@bbb"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは半角英数字混合でないと登録できないこと" do
        @user.password = "123123"
        @user.password_confirmation = "123123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字が入力されていないと進めない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "名前が入力されていないと進めない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名字(カナ) が入力されていないと進めない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "名前（カナ）が入力されていないと進めない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "生年月日が入力されていないと進めない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it "emailに@が含まれていない場合は登録できない" do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end