require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'ilham', password: 'password', email: 'ilham@gmail.com')
    @category = @user.categories.create(name: 'foods', icon: 'https://google.com')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'creates a category' do
      post categories_path, params: { category: { name: 'food', icon: 'https://food.com', user_id: @user.id } }
      expect(response).to redirect_to(categories_path)
    end
  end

  describe 'POST /create' do
    it ' it does not creates a category' do
      post categories_path, params: { category: { icon: 'https://food.com', user_id: @user.id } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get category_path(@category)
      expect(response).to have_http_status(:success)
    end
  end
end
