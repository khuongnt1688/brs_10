class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorized_admin?

  private
  def authorized_admin?
    unless current_user.is_admin?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end