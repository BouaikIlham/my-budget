require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
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
end
