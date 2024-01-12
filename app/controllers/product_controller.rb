class ProductController < ApplicationController

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
  
    if @product.save
      redirect_to product_index_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end
  
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end
  
  private

  def product_params
    params.permit(:title, :description, :price, :category_id, :image)
  end
end
