class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:update, :destroy]

  def create
    product = Product.find(params[:product_id])

    @line_item = current_cart.add_product(product.id)

    if @line_item.save
     redirect_to cart_url, notice: 'Produkt wurde erfolgreich hinzugefügt.'
    else
      redirect_to cart_url, alert: 'Produkt wurde nicht hinzugefügt.'
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to cart_url, notice: 'Produkt wurde erfolgreich aktualisiert.'
    else
      redirect_to cart_url, alert: 'Produkt wurde nicht aktualisiert.'
    end
  end

  def destroy
    @line_item.destroy

    redirect_to cart_url, notice: 'Produkt wurde erfolgreich gelöscht.'
  end

  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :order_id)
    end
end
