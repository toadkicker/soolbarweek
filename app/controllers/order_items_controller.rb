class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def index
    @past_order_items = OrderItem.where(user: current_user).joins(:order).to_a
  end

  def create
    @order = current_order
    @order.user = current_user
    @order.order_status_id = OrderStatus.default[:id]
    @order_items = @order.order_items.new(order_item_params)
    @order_items.user = current_user
    existing_order = @order.order_items.where(event_id: params[:order_item][:event_id])
    if existing_order.count >= 1
      existing_order.last.update_column(:quantity, existing_order.last.quantity + params[:order_item][:quantity].to_i)
    else
      @order.save
    end
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def set_order
    @order = current_order
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :event_id)
  end

end
