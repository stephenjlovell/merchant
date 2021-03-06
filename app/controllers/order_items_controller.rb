class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :destroy]
  before_action :load_order, only: [:create]

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = @order.order_items.find_or_initialize_by_product_id(params[:product_id])
    @order_item.quantity += 1
    
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: 'Item added to cart.' }
        format.json { render action: 'show', status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])
    if params[:order_item][:quantity].to_i == 0 
      @order_item.destroy
      notice = 'Item removed from cart.'
    elsif @order_item.update(order_item_params)
      notice = 'Order item was successfully updated.'
    end
    redirect_to order_url(session[:order_id]), notice: notice
  end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_url(session[:order_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end
end
