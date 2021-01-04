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
   validates :category, numericality: { other_than: 1 } 
   validates :condition, numericality: { other_than: 1 } 
   validates :postage, numericality: { other_than: 1 } 
   validates :prefecture, numericality: { other_than: 0 } 
   validates :shipping_date, numericality: { other_than: 1 } 
  end

  has_one_attached :image

  with_options presence: true do
   validates :name 
   validates :explain 
   validates :price, numericality: { only_integer: true,  greater_than: 300, less_than: 9999999 }, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
   validates :category
   validates :condition
   validates :postage
   validates :prefecture
   validates :shipping_date 
  end
end
