class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if current_user.admin
      @orders = Order.all
    else
      @orders = current_user.order
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new
    @Cart = current_cart
    puts "Debug"
    puts @Cart.to_json
    puts "DebugEnde"
    @order.total_price = @Cart.total_price
    @order.user_id=current_user.id
    @order.order_date=Time.now


    tmp = 100000
    if Order.last.nil?
      @order.order_number = tmp
    else
      @order.order_number = Order.last.order_number + 1
    end


    @Cart.destroy
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Bestellung wurde erfolgreich aufgegeben.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
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

  # DELETE /orders/1
  # DELETE /orders/1.json
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
      params.require(:order).permit(:order_number, :user_id, :total_price, :order_date)
    end
end
