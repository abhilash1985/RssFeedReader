# ArticlesController
class ArticlesController < ApplicationController
  before_action :set_data_feed, only: :index

  def index
    @articles = @data_feed.articles.includes(:data_feed).latest
  end

  def list
    @articles = Article.includes(:data_feed).latest
    render :index
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def set_data_feed
    @data_feed = DataFeed.find(params[:id])
  end
end
