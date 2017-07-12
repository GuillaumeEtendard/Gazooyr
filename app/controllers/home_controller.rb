class HomeController < ApplicationController
  def index
    @gazooies = Gazooy.all
    @pages = Page.all
    @trends = HashTag.group(:name).order('count_id DESC').limit(10).count(:id)
  end
end
