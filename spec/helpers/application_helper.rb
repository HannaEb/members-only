module ApplicationHelper

  def sign_up_user_one
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'marley@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')
  end 

end
