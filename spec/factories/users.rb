FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"あ"}
    first_name {"あ"}
    last_name_katakana {"ア"}
    first_name_katakana {"ア"}
    birth { Faker::Date.backward }
  end
end