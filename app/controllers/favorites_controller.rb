class FavoritesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @user = User.find params[:user_id]
    @favorites = Favorite.user_favorite @user
  end

  def create
    @favorite = Favorite.new favorite_params
    @favorite.user = current_user
    if @favorite.save
      Activity.create(user: current_user,
                      target_id: @favorite.book.id,
                      action_type: "favorite")
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @favorite = Favorite.find params[:id]
    Activity.create(user: current_user,
                    target_id: @favorite.book.id,
                    action_type: "unfavorite")
    @favorite.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit :book_id
  end
end
