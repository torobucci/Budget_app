require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  let(:user) { User.create!(name: 'john_doe', email: 'john@example.com', password: '123456') }
  let(:category) { Category.create!(name: 'Food', icon: 'meal', author: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get category_payments_path(category)

      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get new_category_payment_path(category)

      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new payment' do
        payment_params = { payment: { name: 'Test Payment', amount: 100, category_id: category.id } }

        expect do
          post category_payments_path(category), params: payment_params
        end.to change(Payment, :count).by(1)

        expect(response).to redirect_to(category_payments_path(category))
        expect(flash[:notice]).to eq('Payment created successfully')
      end
    end
  end
end
