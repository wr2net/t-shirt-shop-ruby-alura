class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]
  def index
    @products_list_order_name = Product.order(:name).limit 5
    @products_list_order_price = Product.order(:price).limit 2
  end

  def new
    @product = Product.new
    renderiza :new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = "Produto adicionado com sucesso!"
      redirect_to root_url
    else
      renderiza :new
    end
  end

  def edit
    renderiza :edit
  end

  def update
    if @product.update product_params
      flash[:notice] = "Produto atualizado com sucesso!"
      redirect_to root_url
    else
      renderiza :edit
    end
  end

  def search
    @name_to_search = params[:name]
    @result = Product.where "name like ?", "%#{@name_to_search}%"
  end
  def destroy
    @product.destroy
    redirect_to root_url
  end


  private
  def renderiza(view)
    @departaments = Departament.all
    render view
  end

  def set_product
    id = params[:id]
    @product = Product.find(id)
  end

  def product_params
    params.require(:product).permit :name, :description, :quantitiy, :price, :departament_id
  end
end
