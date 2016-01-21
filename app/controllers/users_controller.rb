class UsersController < ApplicationController
  def show
    @user = current_user
    @dogs = @user.dogs.to_a
    @walks = Walk.all
    @userwalks = @user.walks.sort_by &:date
  end
end
