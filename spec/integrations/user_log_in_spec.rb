require 'rails_helper'

feature 'User login' do

  let(:user) { User.create(username: 'usertest', name: 'User Test') }

  scenario 'they see their username in the header' do
    visit login_path
    
    fill_in 'username', with: user.username
    click_button 'submit'

    expect(page).to have_text user.username
  end

  scenario 'they see an error if the username is empty' do
    visit login_path
    fill_in 'username', with: ''
    
    click_button 'submit'

    expect(page).to have_text 'Username not found'
  end

  scenario 'they see an error if the username does not exist in the database' do
    visit login_path
    fill_in 'username', with: 'asd'
    
    click_button 'submit'

    expect(page).to have_text 'Username not found'
  end
end
