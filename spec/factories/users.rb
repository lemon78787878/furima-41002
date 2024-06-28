FactoryBot.define do
  factory :user do
    nickname              {"マイケル"}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)+'1a'}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    rb_last_name          {"ヤマダ"}
    rb_first_name         {"タロウ"}
    birthday              { '1990-01-01' }
  end
end