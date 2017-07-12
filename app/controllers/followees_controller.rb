class FolloweesController < ApplicationController
  def index
    @profile = find_by_id_or_username
    @followee = Follow.where("follower_id" => @profile.id)
  end

  private
  def find_by_id_or_username
    if params[:profile_id] === 'me'
      user = User.find(current_user.id)
      Profile.find(user.profile.id)
    else
      user = User.find_by(username: params[:profile_id]) || nil
      if user
        Profile.find(user.profile.id)
      else
        Profile.find(params[:profile_id])
      end
    end
  end
end
