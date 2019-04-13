# DataFeedsController
class DataFeedsController < ApplicationController
  before_action :set_data_feed, only: [:show, :edit, :update, :destroy]

  def index
    @data_feeds = DataFeed.all
  end

  def new
    @data_feed = DataFeed.new
  end

  def create
    @data_feed = DataFeed.new(feed_params)

    respond_to do |format|
      if @data_feed.save
        format.html { redirect_to @data_feed, notice: I18n.t('data_feed.save_message') }
        format.json { render :show, status: :created, location: @data_feed }
      else
        format.html { render :new }
        format.json { render json: @data_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @data_feed.update(feed_params)
        format.html { redirect_to @data_feed, notice:  I18n.t('data_feed.edit_message') }
        format.json { render :show, status: :ok, location: @data_feed }
      else
        format.html { render :edit }
        format.json { render json: @data_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @data_feed.destroy
    respond_to do |format|
      format.html { redirect_to data_feeds_url, notice: I18n.t('data_feed.delete_message') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_data_feed
    @data_feed = DataFeed.find(params[:id])
  end

  # Only allow the white listed parameters.
  def feed_params
    params.require(:data_feed).permit(:name, :url, :description)
  end
end
