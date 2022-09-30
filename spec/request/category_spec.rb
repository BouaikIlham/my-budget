require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'ilham', password: 'password', email: 'ilham@gmail.com')
    @category = @user.categories.create(name: 'food', icon: 'https://google.com')
    sign_in @user
  end

  it 'should show correct category name ' do
    visit categories_path
    expect(page).to have_content(@category.name)
  end

  it 'should redirect to add new category' do
    visit categories_path
    click_on 'Add new category'
    expect(page).to have_current_path(new_category_path)
  end
end