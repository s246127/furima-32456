class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_number, :prefecture_id, :city, :district, :building_number, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :district
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number, format: { with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: 'number is invalid. Include half-width numbers' } 
  end
  

  def save
    # 各テーブルにデータを保存する処理を書く 
    # purchasesテーブルにクレカの情報を保存
    purchase = Purchase.create(user_id: user.id, item_id: item.id)

    # addressテーブルに住所の情報を保存
    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, district: district, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end