class OrdersController < ApplicationController
  
  def index
    @order = Order.new
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :item_id, :postal_number, :prefecture_id, :city, :district, :building_number, :phone_number).merge(token: params[:token])
  end
  end
end
