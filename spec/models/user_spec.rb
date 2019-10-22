 
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) {
      User.new(name: "Carmen Luo",
        email: "test@test.com",
        password: "10101010",
        password_confirmation: "10101010")
    }

    it 'should have a valid test' do
      expect(user).to be_valid
    end


    it 'should be invalid without a password' do
      user.password = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'should be invalid without a password_confirmation' do
      user.password_confirmation = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'password must be more than 8 length' do
      user.password = "1010"
      user.password_confirmation = "1010"
      expect(user).to_not be_valid 
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'password must be less than 10 length' do
      user.password = "101010101010"
      user.password_confirmation = "101010101010"
      expect(user).to_not be_valid 
      expect(user.errors.full_messages).to include("Password is too long (maximum is 10 characters)")
    end
    it 'email must be insensitive and unique' do
      User.create(name: "Carmen Luo",
        email: "test@TEST.com",
        password: "10101010",
        password_confirmation: "10101010")
      user1 = User.new(name: "Carmen Luo",
          email: "test@test.com",
          password: "10101010",
          password_confirmation: "10101010")
      expect(!user1.valid?).to eq true
    end
  end

  describe '.authenticate_with_credentials' do
    let(:user) {
      User.create(name: "Carmen Luo",
        email: "test@test.com",
        password: "10101010",
        password_confirmation: "10101010")
    }

    it 'should log in a user who enter valid credentials' do
      user.save
      expect(User.authenticate_with_credentials("test@test.com", "10101010")).to be_truthy
    end

    it 'should log in a user who enter wrong case for their email' do
      user.save
      expect(User.authenticate_with_credentials("test@TEST.com", "10101010")).to be_truthy
    end

    it 'should log in a user who enter in a few spaces before and/or after their email address' do
      user.save
      expect(User.authenticate_with_credentials(" test@test.com ", "10101010")).to be_truthy
    end
  end
  
end