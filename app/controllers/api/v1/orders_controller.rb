class Api::V1::OrdersController < Api::V1::BaseController
  def create
    @order = Order.new(order_params)
    @order.user = @user
    if @order.save
      render 'show'
    else
      render_error
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end



  private

  def order_params
    params.require(:order).permit(:item_id)
  end
end
