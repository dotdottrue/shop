class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    cart = Cart.find(session[:cart_id])

    rescue
    cart = Cart.create if cart.nil?

    session[:cart_id] = cart.id

    cart
  end
  
end
