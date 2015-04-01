class CategoriesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    #@categories = Category.paginate page: params[:page], per_page: 10
    @categories = Category.search(params[:search]).order(sort_column + " " + sort_direction)
    @categories=@categories.paginate(:per_page => 5, :page => params[:page]) 

    if params[:search]
      @categories = Category.search(params[:search]).order("created_at DESC")
    else
      @categories = Category.all.order('created_at DESC')
    end
  end

  private
  def sort_column
    Category.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def category_params
    params.require(:category).permit :content
  end

end
