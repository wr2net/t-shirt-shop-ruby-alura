class ProductsController < ApplicationController

  def index
    @products_list_order_name = Product.order(:name).limit 5
    @products_list_order_price = Product.order(:price).limit 2
  end

end
