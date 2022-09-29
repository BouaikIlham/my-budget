require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: 123_456, password_confirmation: 123_456)
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      category = Category.new(name: 'Food',
                              icon: 'https://cdn.britannica.com/36/123536-050-95CB0C6
                              E/Variety-fruits-vegetables.jpg', user_id: @user.id)
      expect(category).to be_valid
    end

    it 'is not valid without a name' do
      category = Category.new(name: nil,
                              icon: 'https://cdn.britannica.com/36/123536-050-95CB0
                              C6E/Variety-fruits-vegetables.jpg', user_id: @user.id)
      expect(category).to_not be_valid
    end

    it 'is not valid without icon input' do
      category = Category.new(name: 'Food', icon: nil, user_id: @user.id)
      expect(category).to_not be_valid
    end

    it 'is not valid without user id' do
      category = Category.new(name: 'Food',
                              icon: 'https://cdn.britannica.com/36/123536-050-95CB0
                              C6E/Variety-fruits-vegetables.jpg', user_id: nil)
      expect(category).to_not be_valid
    end
  end
end