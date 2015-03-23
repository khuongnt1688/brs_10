class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]

    if(params[:type] == "")
      redirect_to @user
    elsif(params[:type] == "following")
      @title = "Following"
      @users = @user.following.paginate page: params[:page]
      render 'show_follow'
      elsif (params[:type] == "followers")
        @title = "Followers"
        @users = @user.followers.paginate page: params[:page]
        render 'show_follow' 
      end         
  end
    
  def edit
    @user = current_user
  end

end