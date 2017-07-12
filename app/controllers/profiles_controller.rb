class ProfilesController < ApplicationController
  def show
    @profile = find_by_id_or_username
  end

  def edit
    @profile = find_by_id_or_username
  end

  def update
    @profile = find_by_id_or_username
    if @profile.update(pages_params)
      flash[:notice] = "Votre profil a bien été mis-à-jour"
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to root_path
  end

  def followees
    @profile = find_profile_by_id_or_username
    @followee = Follow.where("follower_id" => @profile.id)
  end

  def followers
    @profile = find_profile_by_id_or_username
    @followee = Follow.where("followee_id" => @profile.id)
  end

  def follow
    @profile = Profile.find params[:user_id]
    redirect_to @profile if current_user.profile.follow @profile.id
  end

  def unfollow
    @profile = Profile.find params[:user_id]
    redirect_to @profile if current_user.profile.unfollow @profile.id
  end

  private
  def find_profile_by_id_or_username
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


  def pages_params
    params.require(:profile).permit(:name, :place, :website, :bio, :avatar)
  end


  def find_by_id_or_username
    if params[:id] === 'me'
      user = User.find(current_user.id)
      Profile.find(user.profile.id)
    else
      user = User.find_by(username: params[:id]) || nil
      if user
        Profile.find(user.profile.id)
      else
        Profile.find(params[:id])
      end
    end
  end
end
