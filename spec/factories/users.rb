FactoryBot.define do
  factory :user do
    nickname                   {Faker::Name.initials}
    email                      {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password                   {password}
    password_confirmation      {password}
    gimei = Gimei.new
    last_name                  {gimei.last.kanji}
    first_name                 {gimei.first.kanji}
    katakana_last_name         {gimei.last.katakana}
    katakana_first_name        {gimei.first.katakana}
    birth                      {Faker::Date.in_date_period}
  end
end