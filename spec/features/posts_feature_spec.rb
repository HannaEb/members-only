require 'rails_helper'

feature 'posts' do

  context 'creating posts' do
    scenario 'does not allow logged out users to create posts' do
      visit('/')
      expect(page).not_to have_link('Create New Post')
    end

    scenario 'allows logged in users to create posts' do
      sign_up
      expect(page).to have_link('Create New Post')
    end

    scenario 'displays new posts on homepage' do
      sign_up_and_create_post
      expect(page).to have_content('Post title')
      expect(page).to have_content('Post content')
      expect(current_path).to eq('/')
    end
  end

  context 'viewing posts' do

    before { sign_up_and_create_post}

    scenario 'allows logged out users to view post but not author\'s email' do
      click_link('Sign out')
      expect(page).to have_content('Post title')
      expect(page).to have_content('Post content')
      expect(page).not_to have_content('marley@example.com')
    end

    scenario 'allows logged in users to view post as well as author\'s email' do
      expect(page).to have_content('Post title')
      expect(page).to have_content('Post content')
      expect(page).to have_content('marley@example.com')
    end

  end

end
