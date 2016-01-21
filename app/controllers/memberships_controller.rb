class MembershipsController < ApplicationController
  def create
    @user = current_user
    @dog = Dog.find(params[:dog_id])
    @membership = @dog.memberships.new(membership_params)
    @dog_member = Membership.where(dog_id: @dog.id )

    if @membership.save
      flash[:notice] = "Dog added to walk successfully"
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

  private

  def membership_params
    params.require(:membership).permit(:walk_id)
  end
end
