class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @statuses = OrderStatus.all
    # do something if no user id param
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @past_order_items = OrderItem.where(user_id: params[:user_id]).group(:order_id, :id)
    else
      flash[:info] = "Pick a user to view their order history"
      redirect_to admin_users_path
    end

  end

  def show
    # for printing receipts
  end

  def update
    respond_to do |format|
      if @past_order_items.update(order_params)
        format.html { flash[:notice] = 'Order status was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :index, flash[:error] = @past_order_items.errors.join(', ') }
        format.json { render json: @past_order_items.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  def set_order
    @statuses = OrderStatus.all
    @past_order_items = OrderItem.where(user: params[:user_id]).group(order_id: params[:order_id])
  end

  def order_params
    params.require(:order_item).permit(:user_id, :order_id, :order_status_id)
  end

end
