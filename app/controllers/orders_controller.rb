class OrdersController < ApplicationController
  def new
    @user = current_user
    @order = @user.orders.new
    @products = Product.all
  end

  def create
    @order = current_user.orders.new(order_params)
    cart_list_with_key = JSON.parse(params[:cart_list])
    cart_list = cart_list_with_key.map { |x| x.except!("unique_key") }
    cart_list.each do |cart|
      @order.line_items.build(cart)
    end

    if @order.save
      flash[:notice] = "Your order has been placed successfully!"
      redirect_to user_order_path(current_user, @order)
    else
      flash[:alert] = "Could not place that order. Please try again!"
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
    @line_items = @order.line_items
  end

  private

  def order_params
    params.require(:order).permit(:total, :user_id, line_items_attributes: [:id, :order_id, :product_name, :product_id, :product_quantity, :product_price, :_destroy])
  end
end
