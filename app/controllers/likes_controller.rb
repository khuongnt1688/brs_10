class LikesController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @activity = Activity.find params[:activity_id]
    @like = Like.new
    @like.user = current_user
    @like.activity = @activity
    @like.save
  end

  def destroy
    @like = Like.find params[:id]
    @like.destroy
  end
end