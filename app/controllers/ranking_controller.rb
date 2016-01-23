class RankingController < ApplicationController

  def index
    authenticate_user
    selected_date = Date.today - 1
    @fav_cats = InstagramCat.without_soft_destroyed.order(fav_count: :desc).where(:posted_at => selected_date.beginning_of_day..selected_date.end_of_day).page(1).per(30)
    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = {}
      @fav_cats.each do |fav_cat|
        @fav_flg[fav_cat[:id]] = Favorite.exists?(:cat_id => fav_cat[:id], :user_id => @current_user.id)
      end
    end
  end

  def daily
    authenticate_user
    selected_date = Date.today - 1
    @fav_cats = InstagramCat.without_soft_destroyed.order(fav_count: :desc).where(:posted_at => selected_date.beginning_of_day..selected_date.end_of_day).page(1).per(30)
    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = {}
      @fav_cats.each do |fav_cat|
        @fav_flg[fav_cat[:id]] = Favorite.exists?(:cat_id => fav_cat[:id], :user_id => @current_user.id)
      end
    end
  end

  def monthly
    authenticate_user
    day = Date.today
    start_date = Date::new(day.year,day.month, 1)
    end_date = start_date >> 1
    end_date = end_date - 1
    @fav_cats = InstagramCat.without_soft_destroyed.order(fav_count: :desc).where(:posted_at => start_date..end_date).page(1).per(30)
    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = {}
      @fav_cats.each do |fav_cat|
        @fav_flg[fav_cat[:id]] = Favorite.exists?(:cat_id => fav_cat[:id], :user_id => @current_user.id)
      end
    end
  end

  def total
    authenticate_user
    @selected_date = Date.today
    @fav_cats = InstagramCat.without_soft_destroyed.order(fav_count: :desc).page(1).per(30)
    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = {}
      @fav_cats.each do |fav_cat|
        @fav_flg[fav_cat[:id]] = Favorite.exists?(:cat_id => fav_cat[:id], :user_id => @current_user.id)
      end
    end
  end

end
