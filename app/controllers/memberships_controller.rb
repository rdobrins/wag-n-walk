class MembershipsController < ApplicationController
  def create
    @user = current_user
    @dog = Dog.find(params[:dog_id])
    @membership = @dog.memberships.new(membership_params)
    @dog_member = Membership.where(dog_id: @dog.id )

    if @membership.save
      flash[:notice] = "Dog added to walk successfully"
      # send_text_message(@membership.dog.user.phone_number)
      # ReviewMailer.new_membership(@membership).deliver_later
      redirect_to user_dog_path(@user, @dog)
    else
      flash[:notice] = "Dog already belongs to walk."
      @user = current_user
      @localusers = User.where(:zip == @user.zip)
      @localwalks = Walk.where(@user.zip == @localusers.zip).sort_by &:date
      @membership = Membership.new
      render :'dogs/show'
    end

  end

  def destroy
    @user = current_user
    @dog = Dog.find(params[:dog_id])
    Membership.find(params[:id]).destroy
    redirect_to user_dog_path(@user, @dog)
  end

  private

  def membership_params
    params.require(:membership).permit(:walk_id)
  end
end
