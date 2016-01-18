class LandingController < ApplicationController
  def home
    @user = current_user
  end
end
