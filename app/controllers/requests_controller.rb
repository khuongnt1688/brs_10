class RequestsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def index
    @user = User.find params[:user_id]
  end

  def create
    @request = Request.new request_params
    @request.user = current_user
    @request.state = "waiting"
    if @request.save
      flash[:success] = "Request sent!"
      Activity.create(user: current_user,
                      target_id: @request.id,
                      action_type: "request")
    else
      flash[:error] = "Request failed!"
    end
  end

  def destroy
    @request = Request.find params[:id]
    Activity.destroy_all(target_id: @request.id, 
            action_type: ["request", "request_accept", "request_decline"])
    @request.destroy
  end

  private
  def request_params
    params.require(:request).permit :book_name, :author, :book_url
  end
end