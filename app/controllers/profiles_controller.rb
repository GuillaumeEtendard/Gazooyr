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

  private
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
