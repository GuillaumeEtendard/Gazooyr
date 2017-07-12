class PagesController < ApplicationController
  def show
    @page = Page.find_by(slug: params[:id]) || Page.find(params[:id])
  end

  def new
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

  private
    def pages_params
      params.require(:page).permit(:title, :slug, :content)
    end
end
