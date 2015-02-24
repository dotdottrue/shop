class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart
  helper_method :current_user_order

  def current_cart
    cart = Cart.find(session[:cart_id])

    rescue
    cart = Cart.create if cart.nil?

    session[:cart_id] = cart.id

    cart
  end

  def current_user_order
    order = Order.find(params[:id])

    session[:order_is] = order.id

    user_order = User.find(order.user_id)

    user_order
  end
  
end
