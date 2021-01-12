FactoryBot.define do
  factory :order do
    token            {"tok_abcdefghijk00000000000000000"} 
    postal_number    {"530-0256"} 
    prefecture_id    {2} 
    city             {'堺市南区'} 
    district         {"御池台1-13-2"} 
    building_number  {"304"} 
    phone_number     {"09034562346"}
  end
end
