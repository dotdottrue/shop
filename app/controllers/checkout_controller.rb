class CheckoutController < ApplicationController

  def overview
    @cart = current_cart
  end

end
