class ProductsController < ApplicationController

  def index
    @products_list_order_name = Product.order(:name).limit 5
    @products_list_order_price = Product.order(:price).limit 2
  end

  def create
    new_product = params.require(:product).permit :name, :description, :quantitiy, :price
    product = Product.new new_product
    if product.save
      redirect_to root_url
    else
      render :new
    end
  end

  def search
    @name_to_search = params[:name]
    @result = Product.where "name like ?", "%#{@name_to_search}%"
  end
  def destroy
    id = params[:id]
    Product.destroy id
    redirect_to root_url
  end

end
