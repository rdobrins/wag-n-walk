require 'rails_helper'
# User Authentication Tests

# [X] As a user I want to be able to sign up

feature 'sign up' do

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_on 'Sign up'

    expect(page).to have_content("Please review the problems below:")
  end

end
