class CommentsController < ApplicationController
  def create
    @news = News.find(params[:news_id])
    @comment = @news.comments.new(comments_params)
    @comment.user = current_user
    redirect_to(@news)if @comment.save
  end

  private
  def comments_params
    params.require(:comment).permit(:comment, comments: [:id, :comment])
  end
end
