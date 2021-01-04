FactoryBot.define do

  factory :item do
    association :user
    name              { "hgeiruq" }
    explain           {Faker::Lorem.sentence}
    price             {"1325"}
    category_id          { 2 }
    condition_id         { 2 }
    postage_id           { 2 }
    prefecture_id        { 2 }
    shipping_date_id     { 2 }
  end


 # 1枚の画像をアップロードする(qiita引用)
  trait :image do
   after(:build) do |item|
     File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
       item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
     end
   end
 end

   # 11枚の画像をアップロードする
   trait :images do
    after(:build) do |item|
      11.times do
        File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
          item.images.attach(io: f, filename: "Unknown.jpeg", content_type: 'image/jpeg')
        end
      end
    end
  end

end