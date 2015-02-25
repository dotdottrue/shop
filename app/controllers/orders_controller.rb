class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :cancel_order, :destroy]

  def index
    if current_user.admin
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end

  def show
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)

    @order.total_price = current_cart.total_price
    @order.user_id = current_user.id
    @order.order_date = Time.now
    @order.shipping_method_id = current_cart.shipping_method_id
    @order.payment_id = current_cart.payment_id

    tmp = 100000
    if Order.last.nil?
      @order.order_number = tmp
    else
      @order.order_number = Order.last.order_number + 1
    end
  
    respond_to do |format|
      if @order.save

        current_cart.destroy
        format.html { redirect_to @order, notice: 'Bestellung wurde erfolgreich aufgegeben.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Bestellung wurde erfolgreich geändert.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel_order

    @order.status = :canceled

    if @order.save
      redirect_to orders_url, notice: 'Bestellung wurde erfolgreich storniert.'
    else
      redirect_to orders_url, alert: 'Bestellung wurde nicht storniert.'
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Bestellung wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_number, :user_id, :shipping_method_id, :payment_id, :total_price, :order_date)
    end
end
