require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'ilham', password: 'password', email: 'ilham@gmail.com')
    @category = @user.categories.create(name: 'trip', icon: 'https://google.com')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get operations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'creates an operation' do
      post operations_path, params: { operation: { name: 'ilham', amount: '250', category_id: @category.id } }
      expect(response).to redirect_to(@category)
    end
  end

  describe 'POST /create' do
    it ' it does not creates an operation' do
      post operations_path, params: { operation: { name: 'ilham', category_id: @category.id } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
