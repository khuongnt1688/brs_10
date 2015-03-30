class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:show, :edit]
  helper_method :sort_column, :sort_direction
  respond_to :html, :js

  def index
    @users = User.all.search_by(params[:search]).order(sort_column + ' ' + sort_direction)
    @users = @users.paginate page: params[:page], per_page: 10
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

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def user_params
    params.require(:user).permit :name, :avatar
  end
end