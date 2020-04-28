require 'rails_helper'

feature 'User sees article page' do

  let(:user) { User.create(name: 'Example User', username: 'usertest')}
  let(:category) { Category.create(name: 'Horror', priority: 1) }
  let(:article) do
    article = Article.new(title: 'Title', text: 'Content', author_id: user.id, image: 'https://www.google.com.pe/search?q=dark+wallpaper+netflix&sxsrf=ALeKk01P-lDsl0oyzoEKKGoSoa5CTk7FKw:1588095747582&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiqlJ3X1YvpAhWHZd8KHQyWCXsQ_AUoAXoECA8QAw#imgrc=iK5pVe0LooavdM')
    article.category_ids = [category.id]
    article.save
    article
  end
  scenario 'they see the complete description' do
    visit signup_path
    fill_in 'name', with: user.name
    fill_in 'username', with: user.username
    click_button 'submit'

    visit article_path(article.id)

    expect(page).to have_text article.text
  end
  scenario 'they see the title' do
    visit signup_path
    fill_in 'name', with: user.name
    fill_in 'username', with: user.username
    click_button 'submit'

    visit article_path(article.id)

    expect(page).to have_text article.title
  end
  scenario 'they see the author of the article' do
    visit signup_path
    fill_in 'name', with: user.name
    fill_in 'username', with: user.username
    click_button 'submit'

    visit article_path(article.id)

    expect(page).to have_text article.author.name
  end
end