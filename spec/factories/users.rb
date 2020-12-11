FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               {"aaa111"}
    password_confirmation  {password}
    family_name            {"山田"}
    first_name             {"太郎"}
    family_name_kana       {"ヤマダ"}
    first_name_kana        {"タロウ"}
    birth                  {Faker::Date.between(from: 100.days.ago, to: Date.today)}
  end
end
