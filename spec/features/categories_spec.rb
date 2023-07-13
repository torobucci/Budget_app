require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let!(:user) { User.create!(name: 'john_doe', email: 'john5@example.com', password: '123456') }
  let!(:category) { Category.create!(name: 'Food', icon: 'meal', author: user) }
  let!(:category1) { Category.create!(name: 'Clothes', icon: 'gucci', author: user) }
  let!(:category2) { Category.create!(name: 'Travel', icon: 'Turkish airlines', author: user) }

  before do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  describe 'Index page' do
    it 'displays a list of categories' do
      visit categories_path

      expect(page).to have_content('LOGIN')
    end
  end
end
