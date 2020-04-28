require 'rails_helper'

feature 'User signs up' do

  let(:user) { User.new(username: 'usertest', name: 'User Test') }

  scenario 'they see their username in the header' do
    visit signup_path
    fill_in 'name', with: user.name
    fill_in 'username', with: user.username
    
    click_button 'submit'

    expect(page).to have_text user.username
  end

  scenario 'they see an error if the username is already taken' do
    User.create(username: 'usertest', name: 'User test')
    visit signup_path
    fill_in 'name', with: user.name
    fill_in 'username', with: user.username
    
    click_button 'submit'

    expect(page).to have_text 'Username has already been taken'
  end

  scenario 'they see an error if the username is empty' do
    User.create(username: 'usertest', name: 'User test')
    visit signup_path
    fill_in 'name', with: user.name
    fill_in 'username', with: ''
    
    click_button 'submit'

    expect(page).to have_text "Username can't be blank"
  end

  scenario 'they see an error if the name is empty' do
    User.create(username: 'usertest', name: 'User test')
    visit signup_path
    fill_in 'name', with: ''
    fill_in 'username', with: user.username
    
    click_button 'submit'

    expect(page).to have_text "Name can't be blank"
  end
end
