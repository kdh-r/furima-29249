FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { '111aaa' }
    last_name { '田なカ' }
    first_name { '左とシ' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'サトシ' }
    birthday { Date.today }
  end
end
