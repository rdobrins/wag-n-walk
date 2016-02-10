feature 'user creates walks' do

  scenario 'specifying valid and required information' do
    user2 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_on 'Log in'
    click_link 'Continue to User Profile'
    click_link 'Create Walk'
    fill_in 'walk[date]', with: '17 Mar 2017'
    select '4', :from => 'walk[capacity]'
    click_on 'Create New Walk'
    expect(page).to have_content("March 17, 2017")
  end

  scenario 'specifying valid and required information' do
    user2 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_on 'Log in'
    click_link 'Continue to User Profile'
    click_link 'Create Walk'
    fill_in 'walk[date]', with: '17 Mar 2017'
    select '4', :from => 'walk[capacity]'
    click_on 'Create New Walk'
    expect(page).to have_content("March 17, 2017")
    click_link 'Edit Walk'
    click_link 'Delete Walk'
    expect(page).to_not have_content("March 17, 2017")
  end

end
