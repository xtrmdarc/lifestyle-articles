require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create(name: 'Example User', username: 'usertest')}
  let(:category) { Category.create(name: 'Horror', priority: 1) }
  let(:article) do
    article = Article.new(title: 'Title', text: 'Content', author_id: user.id, image: 'urltest')
    article.category_ids = [category.id]
    article.save
    article
  end

  describe 'validates article attributes' do
    it 'validates if the article is valid' do
      expect(article.valid?).to eql(true)
    end
    it 'validates if the article title is present' do
      article.title = ' '
      expect(article.valid?).not_to eql(true)
    end
    it 'validates if the text is present' do
      article.text = ' '
      expect(article.valid?).not_to eql(true)
    end
    it 'validates if the author is present' do
      article.author_id = nil
      expect(article.valid?).not_to eql(true)
    end
    it 'validates if the image is present' do
      article.image = ' '
      expect(article.valid?).not_to eql(true)
    end
  end

  describe 'validates article methods' do
    it 'validates if most voted article exists' do
      article.vote(user.id)
      expect(Article.most_voted_article).to eql(article)
    end
    it 'validates if user voted for an article' do
      article.vote(user.id)
      expect(article.user_voted?(user.id)).to eql(true)
    end
    it 'validates if user unvoted for an article' do
      article.vote(user.id)
      article.unvote(user.id)
      expect(article.user_voted?(user.id)).not_to eql(true)
    end
  end
end
