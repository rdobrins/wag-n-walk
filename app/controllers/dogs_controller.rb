class DogsController < ApplicationController
  def show
    @user = current_user
    @dog = Dog.find(params[:id])
    @localusers = User.where(:zip == @user.zip)
    @localwalks = Walk.where(@user.zip == @localusers.zip).sort_by &:date
    @assignedwalks = @dog.walks.sort_by &:date
    @membership = Membership.new
    @memberships = @dog.memberships
  end

  def new
    @user = current_user
    @dog = Dog.new
  end

  def create
    @user = current_user
    @dog = Dog.new(dog_params)
    @dog.user = @user

    if @dog.save
      flash[:notice] = "Dog added successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @dog.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @user = current_user
    @dog = Dog.find(params[:id])
  end

  def update
    @user = current_user
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      flash[:notice] = "Dog updated successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @dog.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    Dog.find(params[:id]).destroy
    redirect_to user_path(@user)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :body, :user_id, :avatar)
  end
end
