class NewsController < ApplicationController
  def index
    @news = News.all.order('id DESC')
  end

  def show
    @news = News.find(params[:id])
    @comment = Comment.new
    @comment.news = @news
  end

  def new
    sign_in_redirect
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    @news.user = current_user
    if @news.save
      redirect_to @news
    else
      render 'new'
    end
  end

  def edit
    sign_in_redirect
    @news = News.find(params[:id])
  end

  def update
    @news= News.find(params[:id])
    if @news.update(news_params)
      redirect_to news_path
    else
      render :edit
    end
  end

  private
  def sign_in_redirect
    if !current_user
      return redirect_to new_user_session_path, alert: "Vous devez vous connecter"
    end
  end
  def news_params
    params.require(:news).permit(:title, :summary, :content)
  end
end
