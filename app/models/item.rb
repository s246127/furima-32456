class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date


  has_one :purchase
  belongs_to :user

  with_options presence: true, numericality: {other_than: 1 } do
   validates :category_id 
   validates :condition_id 
   validates :postage_id 
   validates :shipping_date_id 
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 0 }

  has_one_attached :image
  
  with_options presence: true do
   validates :image
   validates :name 
   validates :explain 
   validates :price, numericality: { only_integer: true,  greater_than_or_equal_to:300, less_than_or_equal_to:9999999 }, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
  end
end
