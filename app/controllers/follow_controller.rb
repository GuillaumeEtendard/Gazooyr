class FollowController < ApplicationController
  before_action :authenticate_user!

  def create
    @profile = Profile.find params[:profile_id]
    redirect_to @profile if current_user.profile.follow @profile.id
  end

  def destroy
    @profile = Profile.find params[:profile_id]
    redirect_to @profile if current_user.profile.unfollow @profile.id
  end
end
