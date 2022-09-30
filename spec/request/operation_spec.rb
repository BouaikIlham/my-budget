 require 'rails_helper'

 RSpec.describe 'Operations', type: :system do
   include Devise::Test::IntegrationHelpers
   before do
     driven_by(:rack_test)
     @user = User.create(name: 'nedjwa', password: 'password', email: 'nedjwa@gmail.com')
     @category = @user.categories.create(name: 'trip', icon: 'https://google.com')
     @operation = @user.operations.create(name: 'las vegas', amount: 23.23)
     sign_in @user
   end

   it 'should show correct operation ' do
     visit operations_path
     expect(page).to have_content(@operation.name)
   end

   it 'should have the correct amount' do
     visit operations_path
     expect(page).to have_content(@operation.amount)
   end
 end