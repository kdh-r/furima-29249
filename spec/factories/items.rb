FactoryBot.define do
  factory :item do
    name { 'パソコン' }
    text { 'これはテキストです' }
    category_id { 2 }
    status_id { 2 }
    postage_type_id { 2 }
    ship_from_id { 2 }
    delivery_time_id { 2 }
    price { '300' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
