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
  validates :name, presence: true
  validates :explain, presence: true
  validates :price, presence: true

end
