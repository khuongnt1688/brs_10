class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
    @activities = Activity.user_activity(current_user).paginate page: params[:page], per_page: 10

    if !params[:type].blank? && ['following', 'followers'].include?(params[:type])
      @title = params[:type]
      @users = @user.send(params[:type])
      @users = @users.paginate page: params[:page]
      render 'show_follow' 
    end

  end   

  def edit
    @user = current_user
  end	
end