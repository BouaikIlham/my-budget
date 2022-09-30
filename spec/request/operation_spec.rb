 require 'rails_helper'

 RSpec.describe 'Categories', type: :system do
   include Devise::Test::IntegrationHelpers
   before do
     driven_by(:rack_test)
     @user = User.create(name: 'nedjwa', password: 'password', email: 'nedjwa@gmail.com')
     @category = @user.categories.create(name: 'trip', icon: 'https://google.com')
     @operation = @user.operations.create(name: 'las vegas', amount: 23.23)
     sign_in @user
   end

   it 'should show correct operation ' do
     visit category_path
     expect(page).to have_content(@operation.name)
   end

   it 'should have the correct amount' do
     visit category_path
     expect(page).to have_content(@operation.amount)
   end

   it 'should redirect to add new transaction' do
     visit category_path
     click_on 'Add new operation'
     expect(page).to have_current_path(new_operation_path)
   end
 end