class StaticPageController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: Settings.size.digit_12).microposts_desc
    end
  end

  def help; end

  def about; end

  def contact; end
end
