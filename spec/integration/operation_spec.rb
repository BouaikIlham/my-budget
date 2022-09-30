require 'rails_helper'

RSpec.describe 'Category', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'ilham', password: '123456', email: 'ilham@gmail.com')
    @category = @user.categories.create(name: 'Subscription', icon: 'https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg')
    @operation = @category.operations.create(name: 'Netflix payment', amount: '99', user_id: @user.id)
    @operation2 = @category.operations.create(name: 'Spotify payment', amount: '99', user_id: @user.id)
    sign_in @user
  end

  it 'should show correct transaction name on the correct group page' do
    visit category_url
    expect(page).to have_content(@operation.name)
  end

  it 'should show correct transaction amount on the correct group page ' do
    visit category_url
    expect(page).to have_content(@operation.amount)
  end

  it 'should show transactions total amount on the correct group page ' do
    visit category_url
    expect(page).to have_content(@operation.amount + @operation2.amount)
  end
end