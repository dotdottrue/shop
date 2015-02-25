class CheckoutController < ApplicationController
  before_action :set_cart, only: [:addresses, :overview]
    
  def addresses
    if @cart.invoice_firstname.nil?
      if current_user.company.present?
        @cart.invoice_company = current_user.company
      end
        @cart.invoice_firstname = current_user.firstname
        @cart.invoice_lastname = current_user.lastname
      if current_user.zipcode and current_user.site and current_user.street and current_user.country
        @cart.invoice_zipcode = current_user.zipcode
        @cart.invoice_site = current_user.site
        @cart.invoice_street = current_user.street
        @cart.invoice_country = current_user.country
      end
    end

    if params[:cart].present?
      if !@cart.update(cart_params)
        flash.alert = "Rechnungs- und/oder Lieferadresse konnte nicht geupdatet werden."
      end
    end
  end

  def overview
    if params[:cart].present?
      if @cart.update(cart_params)
        render :overview
      else
        flash.alert = "Rechnungs und/oder Lieferadresse konnte nicht geupdatet werden."
        render :addresses
      end
    else
      render :overview
    end
  end

  private

  def set_cart
    @cart = current_cart
  end

  def cart_params
    #hier nur invoice address und shipping adress felder permitten von der addresses view
    params[:cart].permit(:invoice_company, :invoice_firstname, :invoice_lastname, :invoice_zipcode, :invoice_site, :invoice_street, :invoice_country, :shipping_firstname, :shipping_lastname, :shipping_zipcode, :shipping_site, :shipping_street, :shipping_country, :shipping_company, :optional_invoice_address, :shipping_method_id, :payment_id, line_items_attributes: [:id, :quantity, :_destroy])
  end

end
