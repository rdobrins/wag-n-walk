require 'spec_helper'

feature 'view index page see avatar' do

  scenario 'user edits info and adds avatar' do
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'
    click_link "Edit Info"
    fill_in 'Email', with: user1.email
    fill_in 'Current password', with: user1.password
    page.attach_file("Change Picture", "#{Rails.root}/spec/support/farley_default.png")
    click_button 'Update'

    expect(page).to have_content("Your account has been updated successfully.")

  end

  scenario 'user creates account adds avatar' do
    visit root_path
    click_link 'Sign Up'
    fill_in '* First name', with: "Ryan"
    fill_in '* Last name', with: "Dobrinski"
    fill_in '* Email', with: "ryandob@gmail.com"
    fill_in 'Phone number', with: "5553210123"
    fill_in '* Address', with: "22 This Street"
    fill_in '* City', with: "Hopkinton"
    fill_in '* State', with: "MA"
    fill_in '* Zip', with: "01748"
    fill_in '* Password', with: "password", match: :prefer_exact
    fill_in '* Password confirmation', with: "password"
    page.attach_file("Add Picture", "#{Rails.root}/spec/support/farley_default.png")
    click_on 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
