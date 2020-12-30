class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to: [:category, :condition, :postage, :prefecture, :shipping_date]

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
  validates :name, presence: true
  validates :explain, presence: true
  validates :price, presence: true

end
