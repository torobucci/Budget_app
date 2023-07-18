require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    let(:user) { User.new(name: 'john_doe', email: 'john@example.com', password: '123456') }
    let(:payment) { Payment.new(name: 'Rent', amount: 100.00, author: user) }

    it 'is valid with valid attributes' do
      expect(payment).to be_valid
    end

    it 'is not valid without an author' do
      payment.author = nil
      expect(payment).to_not be_valid
    end

    it 'is not valid without a name' do
      payment.name = nil
      expect(payment).to_not be_valid
    end

    it 'is not valid without an amount' do
      payment.amount = nil
      expect(payment).to_not be_valid
    end

    it 'is not valid with a non-numeric amount' do
      payment.amount = 'abc'
      expect(payment).to_not be_valid
    end
  end
end
