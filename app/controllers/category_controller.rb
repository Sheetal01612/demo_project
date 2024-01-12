class CategoryController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to create_product_path(category_id: @category.id), notice: 'Category created successfully!'
    else
      render :new
    end
  end
  
  def show
    @category = Category.find_by_id(params[:id])
    @products = @category.products
  end

  private

  def category_params
    params.permit(:name, :description)
  end
end