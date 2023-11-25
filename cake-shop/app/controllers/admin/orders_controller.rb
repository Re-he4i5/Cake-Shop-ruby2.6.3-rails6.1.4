class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @subtotal = 0
    @total_price = 0
    @shipping_cost = 800

  end

  def status_update
    
    @order = Order.find(params[:id])
    @order.update(order_params)
    
    if params[:order][:status] == "payment_confirmation"
      @order.order_details.update_all(making_status: 1)
      
    end
    redirect_to admin_order_path(@order)
  end

  def making_status_update
    
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @one_order = @order.order_details

    if @order_detail.update(order_detail_params)
    
      if params[:order_detail][:making_status] == "production"
        @order_detail.order.update(status: 2)
      end

      if @one_order.count == @one_order.where(making_status: "complete").count
        # order_details比較演算
        @order_detail.order.update(status: 3)
      end
      redirect_to admin_order_path(@order_detail.order_id)
    end
  end


  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
