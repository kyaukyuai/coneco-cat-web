class RankingController < ApplicationController

  before_action :authenticate_user

  def index
    @page = params[:page].present? ? params[:page].to_i : 1
    selected_date = Date.today - 1
    @fav_cats = InstagramCat
                  .without_soft_destroyed
                  .order(fav_count: :desc)
                  .where(:posted_at => selected_date.beginning_of_day..selected_date.end_of_day)
                  .page(@page)
                  .per(30)

    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = get_hashed_fav_flg
    end
  end

  def daily
    @page = params[:page].present? ? params[:page].to_i : 1
    selected_date = Date.today - 1
    @fav_cats = InstagramCat
                  .without_soft_destroyed
                  .order(fav_count: :desc)
                  .where(:posted_at => selected_date.beginning_of_day..selected_date.end_of_day)
                  .page(@page)
                  .per(30)

    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = get_hashed_fav_flg
    end
  end

  def monthly
    @page = params[:page].present? ? params[:page].to_i : 1
    day = Date.today
    start_date = Date::new(day.year, day.month, 1)
    end_date = start_date >> 1
    end_date = end_date - 1
    @fav_cats = InstagramCat
                  .without_soft_destroyed
                  .order(fav_count: :desc)
                  .where(:posted_at => start_date..end_date)
                  .page(@page)
                  .per(30)

    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = get_hashed_fav_flg
    end
  end

  def total
    @page = params[:page].present? ? params[:page].to_i : 1
    @fav_cats = InstagramCat
                  .without_soft_destroyed
                  .order(fav_count: :desc)
                  .page(@page)
                  .per(30)

    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = get_hashed_fav_flg
    end
  end

  private

  def get_hashed_fav_flg
    fav_flg = {}
    @fav_cats.each do |fav_cat|
      fav_flg[fav_cat[:id]] = Favorite.exists?(:cat_id => fav_cat[:id], :user_id => @current_user.id)
    end
    fav_flg
  end

end
