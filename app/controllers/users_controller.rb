class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end	
end