class WalksController < ApplicationController
  def index
    @walks = Walk.all
    @user = current_user
  end

  def new
    @user = current_user
    @walk = Walk.new
  end

  def create
    @user = current_user
    @walk = Walk.new(walk_params)
    @walk.user = @user

    if @walk.save
      flash[:notice] = "Walk Created Successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @walk.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @user = current_user
    @walk = Walk.find(params[:id])
  end

  def update
    @user = current_user
    @walk = Walk.find(params[:id])

    if @walk.update(walk_params)
      flash[:notice] = "Walk Updated Successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @walk.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    Walk.find(params[:id]).destroy
    redirect_to user_path(@user)
  end

  private

  def walk_params
    params.require(:walk).permit(:date, :capacity, :body, :user_id)
  end
end
