class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:card_id] = nil

    respond_to do |format|
      format.html { redirect_to(store_url, notice: 'Ihr Einkaufwagen wurde erfolgreich geleert!') }
      format.json { head :ok }
    end
  end

  private

  def set_cart
    @cart = current_cart

    redirect_to store_url, :notice => 'Warenkorb kann nicht geladen werden' if @cart.nil?
  end

  def cart_params
    params[:cart]
  end

end
