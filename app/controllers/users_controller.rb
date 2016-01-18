class UsersController < ApplicationController
  def show
    @user = current_user
    @dogs = @user.dogs.to_a
  end
end
