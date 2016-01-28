class CatController < ApplicationController
  def index
  end

  def show
    authenticate_user
    @cat = InstagramCat.find(params[:id])
    if user_signed_in?
      @profile = @current_user.image
      @fav_flg = {}
      @fav_flg[@cat[:id]] = Favorite.exists?(:cat_id => @cat[:id], :user_id => @current_user.id)
    end
    page = [*1..10].sample.to_i
    @cats = InstagramCat
              .without_soft_destroyed
              .order(fav_count: :desc)
              .page(page)
              .per(6)
  end
end
