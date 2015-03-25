class RequestsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def create
    @request = Request.new request_params
    @request.user = current_user
    @request.state = "waiting"
    if @request.save
      flash[:success] = "Request sent!"
    else
      flash[:error] = "Request failed!"
    end
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
  end

  private
  def request_params
    params.require(:request).permit :book_name, :author, :book_url
  end
end