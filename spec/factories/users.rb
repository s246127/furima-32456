FactoryBot.define do
  factory :user do

    japanese_user = Gimei.name

    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    first_name            {japanese_user.first.kanji}
    last_name             {japanese_user.last.kanji}
    first_name_kana       {japanese_user.first.katakana}
    last_name_kana        {japanese_user.last.katakana}
    birthday              {Faker::Date.birthday}
  end
end
