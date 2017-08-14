class Admin::OrderStatusesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_order_status, only: [:edit, :update]


  def index
    @order_statuses = OrderStatus.order(:ordinality)
  end

  def new
    @order_status = OrderStatus.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order_status.update(order_status_params)
        format.html { redirect_to admin_order_statuses_url, notice: 'Order Status was successfully updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @order_status.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_status_params
    params.require(:order_status).permit(:name, :default, :ordinality)
  end

  def set_order_status
    @order_status = OrderStatus.find(params[:id])
  end

end
