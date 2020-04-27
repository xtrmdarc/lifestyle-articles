require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new(name: 'Example User', username: 'usertest')}

  describe 'validates user attributes' do
    it 'validates if the user is valid' do
      expect(user.valid?).to eql(true)
    end
    it 'validates if the user name is present' do
      user.name = ' '
      expect(user.valid?).not_to eql(true)
    end
    it 'validates if the username is present' do
      user.username = ' '
      expect(user.valid?).not_to eql(true)
    end
    it 'validates if the usernames are unique' do
      duplicate_user = user.dup
      duplicate_user.username = user.username
      user.save
      expect(duplicate_user.valid?).not_to eql(true)
    end
  end
end
