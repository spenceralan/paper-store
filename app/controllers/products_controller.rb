class ProductsController < ApplicationController

  def index
    @products = Product.order(:name).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "The product has been updated."
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:notice] = "The product has been deleted."
    redirect_to root_path
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Your product has been saved."
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def search
    products = Product.find_by_country(params[:country])
    @products = products.page params[:page]
    render :index
  end

private
  def product_params
    params.require(:product).permit(:name, :price, :country)
  end

end
