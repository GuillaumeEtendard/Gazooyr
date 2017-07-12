class HomeController < ApplicationController
  def index
    @gazooies = Gazooy.all
    @pages = Page.all
  end
end
