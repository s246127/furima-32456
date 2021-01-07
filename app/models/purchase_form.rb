class Purchase_form
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_number, :prefecture_id, :city, :district, :building_number, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence :trure do
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 
    validates :city
    validates :district
  end

  def save
    # 各テーブルにデータを保存する処理を書く 
    # purchasesテーブルにクレカの情報を保存
    Purchase.create(user_id: user.id, item_id: item.id)

    # addressテーブルに住所の情報を保存
    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, district: district, building_number: building_number, phone_number: phone_number, user_id: user.id, item_id: item.id)
  end
end