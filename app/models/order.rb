class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_number, :prefecture_id, :city, :district, :building_number, :phone_number

  with_options presence: true do
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :district
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'number is invalid. Include half-width numbers' } 
  end
  

  def save
    # 各テーブルにデータを保存する処理を書く 
    # purchasesテーブルにの情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    # addressテーブルに住所の情報を保存
    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, district: district, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end