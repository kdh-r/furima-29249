FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { '111aaa' }
    last_name { '田中' }
    first_name { '聡' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'サトシ' }
    birthday { Date.today }
  end
end
