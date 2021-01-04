class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date


  has_one :purchase
  belongs_to :user

  with_options presence: true do
   validates :category_id, numericality: { other_than: 1 } 
   validates :condition_id, numericality: { other_than: 1 } 
   validates :postage_id, numericality: { other_than: 1 } 
   validates :prefecture_id, numericality: { other_than: 0 } 
   validates :shipping_date_id, numericality: { other_than: 1 } 
  end

  has_one_attached :image

  with_options presence: true do
   validates :user_id
   validates :name 
   validates :explain 
   validates :price, numericality: { only_integer: true,  greater_than: 300, less_than: 9999999 }, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
   validates :category_id
   validates :condition_id
   validates :postage_id
   validates :prefecture_id
   validates :shipping_date_id 
  end
end
