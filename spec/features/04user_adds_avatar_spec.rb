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

end
