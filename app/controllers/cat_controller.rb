class CatController < ApplicationController
  def index
  end

  def show
    authenticate_user
    @cat = InstagramCat.find(params[:id])
    if user_signed_in?
      @profile = @current_user.image
    end
  end
end
