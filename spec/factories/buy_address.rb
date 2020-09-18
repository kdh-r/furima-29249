FactoryBot.define do
  factory :buy_address do
    token { 'aaaaa' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city {'東京都葛飾区'}
    address {'東新小岩1-1-1'}
    phone_number { '09011111111' }
    association :user
    association :item
  end
end
