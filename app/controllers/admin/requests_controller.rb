class Admin::RequestsController < AdminController
  respond_to :html, :js

  def index
    @requests = Request.all.paginate page: params[:page]
  end

  def update
    @request = Request.find params[:id]
    @request.update_attributes request_params
    Activity.create(user: @request.user,
                    target_id: @request.id,
                    action_type: "request_#{@request.state}")
  end

  private
  def request_params
    params.require(:request).permit :state
  end
end