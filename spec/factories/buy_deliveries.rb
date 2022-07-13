FactoryBot.define do
  factory :buy_delivery do
    zip_code { '123-4567' }
    prefecture_id { 2 }
    city { '2' }
    address_line1 { '2' }
    address_line2 { '2' }
    tel { '09012345678' }
  end
end
