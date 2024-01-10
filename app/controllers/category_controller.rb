class CategoryController < ApplicationController
  def create
    category = Category.create(category_params)
    if category.save
      render json: category, status: :ok
    end 
  end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.permit(:name, :description)
  end
end