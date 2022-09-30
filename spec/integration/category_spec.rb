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
end