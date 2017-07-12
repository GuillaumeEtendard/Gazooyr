class GazooiesController < ApplicationController

  def index
    @gazooies = Gazooy.all.order('id DESC')
  end

  def show
    @gazooy = Gazooy.find(params[:id])
  end

  def create
    if !current_user
      return redirect_to new_user_session_path, alert: "Vous devez vous connectez"
    end
    @gazooy = Gazooy.new(gazooies_params)
    @gazooy.user = current_user
    redirect_to(gazooies_path)if @gazooy.save
  end

  private
    def gazooies_params
      params.require(:gazooy).permit(:text)
    end
end
