FactoryBot.define do
  factory :user do
    nickname              {"ab"}
    email                 {Faker::Internet.free_email}
    password              {"1a1a1a"}
    password_confirmation {"1a1a1a"}
    last_name             {"阿部"}
    first_name            {"晋三"}
    last_name_kana        {"アベ"}
    first_name_kana       {"シンゾウ"}
    birthdate             {"1991-05-12"}
  end
end
