class ProfilesController < ApplicationController
  def update
    if @profile.update(profile_params)
      redirect_to current_user, notice: 'Profile was successfully updated.'
    else
      flash[:alert] = 'Information incorrect'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar)
  end
end
