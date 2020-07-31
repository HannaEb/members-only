module ApplicationHelper

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'marley@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')
  end

  def sign_up_and_create_post
    sign_up
    click_link('Create New Post')
    fill_in('Title', with: 'Post title')
    fill_in('Content', with: 'Post content')
    click_button('Create')
  end

end
