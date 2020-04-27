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

  describe 'validates user associations' do
    it 'validates if articles association exists' do
      user.save
      cat = Category.create(name: 'Horror', priority: 1)
      article = Article.new(title: 'Title', text: 'Content', author_id: user.id, image: 'urltest')
      article.category_ids = [cat.id]
      article.save
      expect(user.articles.count).to eql(1)
    end
  end
end
