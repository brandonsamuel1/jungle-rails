
RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should save required validations' do
      @user = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: 'brandonsamuel2@gmail.com',
        password: 'brandon',
        password_confirmation: 'brandon'
        })
      expect(@user).to be_valid
    end
    it 'should not save with unmatched passwords' do
      @user = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: 'brandonsamuel2@gmail.com',
        password: '123',
        password_confirmation: '124'
        })
      expect(@user).to_not be_valid
    end
    it 'should save with matching passwords' do
      @user = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: 'brandonsamuel2@gmail.com',
        password: 'abc',
        password_confirmation: 'abc'
        })
      expect(@user).to be_valid
    end
    it 'should save if emails are unique' do
      @user1 = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: 'brandonsamuel2@gmail.com',
        password: '123',
        password_confirmation: '123'
        })
      expect(@user1.save).to(be_truthy)
      @user2 = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: 'BRANDONsamuel2@gmail.COM',
        password: '123',
        password_confirmation: '123'
        })
      expect(@user2).to_not be_valid
    end
    it 'should not save with no input for email' do
      @user = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: '',
        password: 'abc',
        password_confirmation: 'abc'
        })
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'should not save with no input for first name' do
      @user = User.new({
        first_name: '',
        last_name: 'Samuel',
        email: 'brandonsamuel2@gmail.com',
        password: 'abc',
        password_confirmation: 'abc'
        })
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'should not save with no input for last name' do
      @user = User.new({
        first_name: 'Brandon',
        last_name: '',
        email: 'brandonsamuel2@gmail.com',
        password: 'abc',
        password_confirmation: 'abc'
        })
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should not save with less than 3 characters for password' do
      @user = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: 'brandonsamuel2@gmail.com',
        password: 'ab',
        password_confirmation: 'ab'
        })
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
    it 'should save with spaces at the beginning and end of input for email' do
      @user = User.new({
        first_name: 'Brandon',
        last_name: 'Samuel',
        email: ' brandonsamuel2@gmail.com ',
        password: 'abc',
        password_confirmation: 'abc'
        })
      expect(@user).to be_valid
    end
  end
end













