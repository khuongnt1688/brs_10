class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :correct_user!, only: [:edit, :update, :destroy]

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = "Review created!"
      redirect_to @review
    else
      flash[:error] = "Cannot send review"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review destroyed!"
    redirect_to request.referrer || root_url
  end

  def show
    @review = Review.find params[:id]
    @comments = @review.comments.paginate page: params[:page], per_page: 8
    @comment = @review.comments.build if user_signed_in?
  end

  def edit
    @review = Review.find params[:id]
  end

  def update
    @review = Review.find params[:id]
    if @review.update_attributes review_params
      flash[:success] = "Review updated!"
      redirect_to @review
    else
      render "edit"
    end
  end

  private
    def review_params
      params.require(:review).permit :content, :rating
    end

    def correct_user!
      @review = current_user.reviews.find_by id: params[:id]
      redirect_to root_url if @review.nil?
    end
end
