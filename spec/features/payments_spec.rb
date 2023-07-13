require 'rails_helper'

RSpec.describe 'Payments', type: :feature do
  let!(:user) { User.create!(name: 'john_doe', email: 'john8@example.com', password: '123456') }
  let!(:category) { Category.create!(name: 'Food', icon: 'https://previews.123rf.com/images/olgastrelnikova/olgastrelnikova1901/olgastrelnikova190100001/115903194-food-icon-with-smile-label-for-food-company-grocery-store-icon-vector-illustration-with-smiling.jpg', author: user) }
  let!(:payment1) { category.payments.create!(name: 'Payment 1', amount: 10, author: user) }
  let!(:payment2) { category.payments.create!(name: 'Payment 2', amount: 20, author: user) }
  let!(:payment3) { category.payments.create!(name: 'Payment 3', amount: 30, author: user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'Index page' do
    it 'displays the payments' do
      visit category_payments_path(category)

      expect(page).to have_content(payment1.name)
      expect(page).to have_content(payment2.name)
      expect(page).to have_content(payment3.name)
      expect(page).to have_css('.payments-header')
      expect(page).to have_link('Add new payment', href: new_category_payment_path(category), class: 'add-new-link')
    end
  end

  describe 'New page' do
    it 'creates a new category' do
      visit new_category_payment_path(category)

      expect(page).to have_css('.payments-header')
      expect(page).to have_css('.payments-header i.fa-bars')
      expect(page).to have_css('.payments-header h2', text: 'ADD NEW PAYMENT')
      expect(page).to have_link(href: category_payments_path(category)) { find('i.fa-arrow-left') }
    end
  end
end
