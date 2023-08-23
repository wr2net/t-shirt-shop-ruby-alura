class ProductsController < ApplicationController

  def index
    @products_list_order_name = Product.order(:name).limit 5
    @products_list_order_price = Product.order(:price).limit 2
  end

  def new
    @product = Product.new
  end

  def create
    values = params.require(:product).permit :name, :description, :quantitiy, :price
    @product = Product.new values
    if @product.save
      flash[:notice] = "Produto adicionado com sucesso!"
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
