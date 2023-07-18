require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { User.new(name: 'john_doe', email: 'john@example.com', password: '123456') }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate case-insensitive email' do
      User.create(name: 'jane_smith', email: 'john@example.com', password: '654321')
      expect(user).to_not be_valid
    end
  end
end
