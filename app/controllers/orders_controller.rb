class OrdersController < ApplicationController
  
  def index
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  # def create
  #   binding.pry
  #   @order = Order.new(order_params)
  #   if @order.valid?
  #     Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #     Payjp::Charge.create(
  #       amount: order_params[:price],  # 商品の値段
  #       card: order_params[:token],    # カードトークン
  #       currency: 'jpy'                 # 通貨の種類（日本円）
  #     )
  #     @order.save
  #     return redirect_to root_path
  #   else
  #     render 'index'
  #   end
  # end

  private

  def order_params
    params.permit(:postal_number, :prefecture_id, :city, :district, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
