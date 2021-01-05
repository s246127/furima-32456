FactoryBot.define do

  factory :item do
    association :user
    name              { "hgeiruq" }
    explain           {Faker::Lorem.sentence}
    price             {1325}
    category_id          { 2 }
    condition_id         { 2 }
    postage_id           { 2 }
    prefecture_id        { 2 }
    shipping_date_id     { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.jpg', content_type: 'image/png')
    end
  end
end