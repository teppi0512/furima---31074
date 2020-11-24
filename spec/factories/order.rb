FactoryBot.define do
  factory :order do

    postal_cord      {"123-4567"}
    prefecture_id    {"1"}
    city             {"札幌市"}
    addresses        {"1-1"}
    building         {"レオパレス札幌 101"}
    phone_number     {"08012345678"}
    token            {"400"}

  end  
end
