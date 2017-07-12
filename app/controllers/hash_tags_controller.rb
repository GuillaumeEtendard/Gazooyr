class HashTagsController < ApplicationController
  def show
    @gazooies = Gazooy.joins(:hash_tags).where('hash_tags.name = ?', params[:id])
  end
end
