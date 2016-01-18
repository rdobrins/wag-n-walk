class DogsController < ApplicationController
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
      flash[:errors] = @review.errors.full_messages.join(". ")
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
