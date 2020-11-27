require 'rails_helper' # RailsでRSpecを使うときの共通の設定

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "ニックネームが必須であること" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "メールアドレスは、@を含む必要があること" do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is include both letters and numbers")
    end
    
    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password_confirmation = "def456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は、名字が必須であること" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "ユーザー本名は、名前が必須であること" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること（名字）" do
      @user.last_name = "anzai"
      @user.valid?
      expect(@user.errors.full_messages).to include(
        "Last name は全角（漢字・ひらがな・カタカナ）で入力してください。")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること（名前）" do
      @user.first_name = "anzai"
      @user.valid?
      expect(@user.errors.full_messages).to include(
        "First name は全角（漢字・ひらがな・カタカナ）で入力してください。")
    end

    it "ユーザー本名のフリガナは、名字が必須であること" do
      @user.katakana_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
    end

    it "ユーザー本名のフリガナは、名前が必須であること" do
      @user.katakana_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること（名字）" do
      @user.katakana_last_name = "安西"
      @user.valid?
      expect(@user.errors.full_messages).to include(
        "Katakana last name は全角（カタカナ）で入力してください。")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること（名前）" do
      @user.katakana_first_name = "sensei"
      @user.valid?
      expect(@user.errors.full_messages).to include(
        "Katakana first name は全角（カタカナ）で入力してください。")
    end

    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

