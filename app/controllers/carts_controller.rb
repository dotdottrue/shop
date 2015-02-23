class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @cart.update(cart_params)
      redirect_to cart_path, notice: 'Cart was successfully updated.'
    else
      redirect_to cart_path, alert: 'Error'
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:card_id] = nil

    redirect_to cart_path, notice: 'Ihr Einkaufwagen wurde erfolgreich geleert!' 
  end

  private

  def set_cart
    @cart = current_cart

    redirect_to cart_path, :notice => 'Warenkorb kann nicht geladen werden' if @cart.nil?
  end

  def cart_params
    params[:cart].permit(:shipping_method_id, :payment_method_id, line_items_attributes: [:id, :quantity, :_destroy])
  end

end
