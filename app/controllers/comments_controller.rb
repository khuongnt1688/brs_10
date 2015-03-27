class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user!,  only: [:destroy, :edit, :update]

  def create
    @review = Review.find params[:review_id]
    @comment = Comment.new comment_params
    @comment.user = current_user
    @comment.review = @review
    if @comment.save
      Activity.create(user: current_user, 
                      target_id: @comment.id, 
                      action_type: "comment")
      respond_to do |format|
        format.js 
      end
    end
  end

  def destroy
    @review = Review.find params[:review_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @review}
      format.js 
    end
  end

  def update
    @review = Review.find params[:review_id]
    @comment = Comment.find params[:id]
    @comment.update_attributes comment_params
    respond_to do |format|
      format.html {redirect_to @review}
      format.js 
    end
  end

  private
    def comment_params
      params.require(:comment).permit :content
    end

    def correct_user!
      @comment = current_user.comments.find_by id: params[:id]
      redirect_to root_url if @comment.nil?
    end
end