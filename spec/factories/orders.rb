FactoryBot.define do
  factory :order do
    user_id          {2}
    item_id          {2}
    token            {"tok_abcdefghijk00000000000000000"} 
    postal_number    {"530-0256"} 
    prefecture_id    {2} 
    city             {'堺市南区'} 
    district         {"御池台1-13-2"} 
    building_number  {"304"} 
    phone_number     {"090-3456-2346"}
  end
end
