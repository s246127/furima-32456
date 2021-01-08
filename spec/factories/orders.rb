FactoryBot.define do
  factory :order do
    user_id          {2}
    item_id          {2}
    token            {2} 
    postal_number    {"530-0256"} 
    prefecture_id    {2} 
    city             {'堺'} 
    district         {'北区'} 
    building_number  {} 
    phone_number     {"090-3456-2346"}
  end
end
