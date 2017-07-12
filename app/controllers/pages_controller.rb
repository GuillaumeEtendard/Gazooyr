class PagesController < ApplicationController
  def show
    @page = Page.find_by(slug: params[:id]) || Page.find(params[:id])
  end

  def new
    sign_in_redirect
    @page = Page.new
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end

  def edit
    sign_in_redirect
    @page = Page.find(params[:id])
  end

  def update
    @page= Page.find(params[:id])
    if @page.update(pages_params)
      redirect_to @page
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  private
    def sign_in_redirect
      if !current_user
        return redirect_to new_user_session_path, alert: "Vous devez vous connecter"
      end
    end
    def pages_params
      params.require(:page).permit(:title, :slug, :content)
    end
end
