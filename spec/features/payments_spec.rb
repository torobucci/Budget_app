require 'rails_helper'

RSpec.describe 'Payments', type: :feature do
  let!(:user) { User.create!(name: 'john_doe', email: 'john8@example.com', password: '123456') }
  let!(:category) { Category.create!(name: 'Food', icon: 'meal', author: user) }
  let!(:payment1) { category.payments.create!(name: 'Payment 1', amount: 10, author: user) }
  let!(:payment2) { category.payments.create!(name: 'Payment 2', amount: 20, author: user) }
  let!(:payment3) { category.payments.create!(name: 'Payment 3', amount: 30, author: user) }
  let(:payments) { [payment1, payment2, payment3] }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'Index page' do
    it 'displays the payments' do
      visit category_payments_path(category)

      expect(page).to have_content('LOGIN')
    end
  end
end
