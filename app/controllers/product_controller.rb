class ProductController < ApplicationController
  
  def create
    unless current_user.role == 'buyer'
      product = Product.create(product_params)
      if product.save
        render json: product, status: :ok
      end
    end
  end

  # def index
    
  # end


  private

  def product_params
    params.permit(:title, :description, :price, :category_id)
  end
  
end
