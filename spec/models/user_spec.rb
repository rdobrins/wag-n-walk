require 'spec_helper'
require 'rails_helper'

RSpec.describe User do
  it { should have_valid(:first_name).when('John', 'Sally') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Dobrinski') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
  it { should_not have_valid(:email).when(nil, "", 'ryan@com', 'ryan.com') }

  it { should have_valid(:address).when('1 Main St', '100 Golden Road') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when('Hopkinton', 'Boston') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA', 'WI') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip).when('01234', '98765') }
  it { should_not have_valid(:zip).when(nil, '') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'not the same password'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
