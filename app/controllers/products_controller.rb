class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! , only: [:edit, :update, :destroy, :new, :create]
  before_filter :is_admin? , only: [:edit, :update, :destroy, :new, :create]

  def index
    @products = if params[:category_id]
                  Category.find(params[:category_id]).products
                else
                  Product.all
                end
    @products = @products.paginate(:page => params[:page], :per_page => 21)
  end

  def show
  end

  def review
    @product = Product.find(params[:id])
    @review = Review.new
    @reviews = @product.reviews
  end

  def is_admin?
    if current_user.admin?
      true
    else
      redirect_to :products, alert: 'Sorry, du musst Admin sein um das zu tun!'
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produkt wurde erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Produkt wurde erfolgreich aktualisiert.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Produkt wurde erfolgreich entfernt.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :short_description, :in_stock, :price, :vat_rate, :avatar, category_ids: [])
    end
end
