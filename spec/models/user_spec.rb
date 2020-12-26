require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do


    context 'ユーザー新規登録ができるとき' do
      it '全ての項目が入力されていれば登録ができること' do
        expect(@user).to be_valid
      end  
    end  


    context '新規登録ができないとき' do

      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "passwordがない場合は登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "password_confirmationが空の場合は登録できないこと" do
        @user.encrypted_password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password can't be blank")
      end
  
      it "last_nameがない場合は登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it "first_nameがない場合は登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it "last_name_kanaがない場合は登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      
      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it "birthdayがない場合は登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
  
  
      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user) # createメソッドを使用して変数userとデータベースにfactory_botのダミーデータを保存
        another_user = build(:user, email: user.email) # 2人目のanother_userを変数として作成し、buildメソッドを使用して、意図的にemailの内容を重複させる
        another_user.valid? # another_userの「バリデーションにより保存ができない状態であるか」をテスト
        expect(another_user.errors[:email]).to include("has already been taken") # errorsメソッドを使用して、emailの「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、その原因のエラー文を記述
      end
  
      it "passwordは半角英数字混合でないと登録できないこと" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password is invalid")
      end
  
      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = nil # 意図的に確認用パスワードに値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "passwordが6文字以下であれば登録できないこと" do
        @user.password = "12345" && @user.password_confirmation = "12345" # 意図的に6文字のパスワードを設定してエラーが出るかをテスト 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Encrypted password is invalid")
      end


      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      # カタカナ全角入力のテスト ▼

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana =  "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana =  "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end  
  end
end


