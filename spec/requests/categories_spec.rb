require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET #index' do
    it 'renders the index template' do
      user = User.create!(name: 'john_doe', email: 'john@example.com', password: '123456')
      sign_in user

      get categories_path

      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      user = User.create!(name: 'john_doe', email: 'john@example.com', password: '123456')
      sign_in user

      get new_category_path

      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        user = User.create!(name: 'john_doe', email: 'john@example.com', password: '123456')
        sign_in user
        category_params = { category: { name: 'Test Category', icon: 'icon.png' } }

        expect do
          post categories_path, params: category_params
        end.to change(Category, :count).by(1)

        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category created successfully')
      end
    end

    context 'with invalid parameters' do
      it 'renders the new template' do
        user = User.create!(name: 'john_doe', email: 'john@example.com', password: '123456')
        sign_in user
        category_params = { category: { name: '', icon: '' } }

        expect do
          post categories_path, params: category_params
        end.not_to change(Category, :count)

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
