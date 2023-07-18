require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    let(:user) { User.new(name: 'john_doe', email: 'john@example.com', password: '123456') }
    let(:category) { Category.new(name: 'Food', icon: 'meal', author: user) }

    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'is not valid without an author' do
      category.author = nil
      expect(category).to_not be_valid
    end

    it 'is not valid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'is not valid without a unique name' do
      Category.create(name: 'Food', icon: 'burger', author: user)
      expect(category).to_not be_valid
    end

    it 'is not valid without an icon' do
      category.icon = nil
      expect(category).to_not be_valid
    end
  end

  describe 'total_expenses' do
    let(:user) { User.create!(name: 'john_doe', email: 'john@example.com', password: '123456') }
    let(:category) { Category.create!(name: 'Food', icon: 'meal', author: user) }
    let!(:payment1) { category.payments.create!(name: 'Groceries', amount: 50.00, author: user) }
    let!(:payment2) { category.payments.create!(name: 'Restaurant', amount: 30.00, author: user) }

    it 'returns the total expenses for the category' do
      expect(category.total_payments).to eq(80.00)
    end
  end
end
