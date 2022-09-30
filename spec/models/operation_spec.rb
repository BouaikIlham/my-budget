require 'rails_helper'

RSpec.describe Operation, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: 123_456, password_confirmation: 123_456)
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      operation = Operation.new(name: 'Bought WinRAR', amount: '50', user_id: @user.id)
      expect(operation).to be_valid
    end

    it 'is not valid without a name' do
      operation = Operation.new(name: nil, amount: '50', user_id: @user.id)
      expect(operation).to_not be_valid
    end

    it 'is not valid without amount input' do
      operation = Operation.new(name: 'Bought WinRAR', amount: nil, user_id: @user.id)
      expect(operation).to_not be_valid
    end

    it 'is not valid without user id' do
      operation = Operation.new(name: 'Bought WinRAR', amount: '50', user_id: nil)

      expect(operation).to_not be_valid
    end
  end
end
