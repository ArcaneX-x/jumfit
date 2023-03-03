class UsersController < ApplicationController
  before_action :set_current_user

  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'Useer updated successfully.'
      redirect_to current_user
    else
      flash.now[:alert] = 'There was a problem updating your profile.'
      render :edit
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, profile_attributes: [:id, :avatar])
  end
end
