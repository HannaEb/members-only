require 'rails_helper'

feature 'user can sign in and out' do

  context 'user not signed in' do
    scenario 'should display a sign up link and a sign in link' do
      visit('/')
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

    scenario 'should not display a sign out link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in' do

    before { sign_up }

    scenario 'should display a sign out link' do
      expect(page).to have_link('Sign out')
    end

    scenario 'should not display a sign up link and a sign in link' do
      expect(page).not_to have_link('Sign up')
      expect(page).not_to have_link('Sign in')
    end
  end

end
