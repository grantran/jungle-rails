require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid if all fields are present corrently' do
      user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '123',
        password_confirmation: '123')
      expect(user).to be_valid
    end

    it 'should have matching password and password confirmation' do
      user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '123',
        password_confirmation: '1234')
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should have password_confirmation' do
      user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: nil,
        password_confirmation: '1234')
      expect(user.errors.full_messages).to include("Password can't be blank")
    end 

    it 'should have password_confirmation' do
      user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '123',
        password_confirmation: nil)
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end 

    it 'should have unique emails' do
      user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '123',
        password_confirmation: '123')

      not_unique_user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'G@G.com', password: '123',
        password_confirmation: '123')
      expect(not_unique_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not have blank email' do
      user = User.create(first_name: 'grant', last_name: 'tran', 
        email: nil, password: '1234',
        password_confirmation: '1234')
      expect(user.errors.has_key?(:email)).to be_truthy
    end 


    it 'should have first_name' do
      user = User.create(first_name: nil, last_name: 'tran', 
        email: 'g@g.com', password: '1234',
        password_confirmation: '1234')
      expect(user.errors.has_key?(:first_name)).to be_truthy
    end 

    it 'should have last_name' do
      user = User.create(first_name: 'grant', last_name: nil, 
        email: 'g@g.com', password: '1234',
        password_confirmation: '1234')
      expect(user.errors.has_key?(:last_name)).to be_truthy
    end

    it 'should have a password at least 3 chars long' do
      user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '12',
        password_confirmation: '12')
      expect(user.errors.full_messages).to include('Password is too short (minimum is 3 characters)')
    end 
  end

    describe '.authenticate_with_credentials' do
      it 'should match password and email' do
        user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '123',
        password_confirmation: '123')
        session = User.authenticate_with_credentials('g@g.com', '123')
        expect(session).to eq user
      end

      it 'should not login with incorrect pw and/or email' do
        user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '123',
        password_confirmation: '123')
        session = User.authenticate_with_credentials('f@g.com', '123')
        expect(session).not_to eq user
      end

      it 'should not care about empty spaces after the email' do
        user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'g@g.com', password: '123',
        password_confirmation: '123')
        session = User.authenticate_with_credentials('g@g.com  ', '123')
        expect(session).to eq user
      end

      it 'should not care about case in the email' do
        user = User.create(first_name: 'grant', last_name: 'tran', 
        email: 'example@example.com', password: '123',
        password_confirmation: '123')
        session = User.authenticate_with_credentials('EXAMpLE@exaMPLE.com  ', '123')
        expect(session).to eq user
      end
    end
  
end
