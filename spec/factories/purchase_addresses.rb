FactoryBot.define do
  factory :purchase_address do
    postcode       {'123-1234'}
    prefecture_id  {Faker::Number.between(from: 2, to:48)}
    address = Gimei.address
    city           {address.city.kanji}
    address        {address.town.kanji}
    building       {Faker::Address.building_number}
    token          {Faker::Code.nric}
    tel            {Faker::Number.leading_zero_number(digits: 11)}
  end
end
