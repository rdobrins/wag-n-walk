feature 'create dog objects through user page' do

  scenario 'specifying valid and required information' do
    user2 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_on 'Log in'
    click_link 'Continue to User Profile'
    click_link 'Add Dog'
    fill_in 'Name', with: 'Bennett'
    fill_in 'Breed', with: 'Beagle'
    click_on 'Submit New Dog'
    expect(page).to have_content("Bennett")
  end

  scenario 'leaves breed field blank' do
    user2 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_on 'Log in'
    click_link 'Continue to User Profile'
    click_link 'Add Dog'
    fill_in 'Name', with: 'Bennett'
    click_on 'Submit New Dog'
    expect(page).to have_content("Breed can't be blank")
  end

end
