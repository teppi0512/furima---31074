FactoryBot.define do
  factory :item do
    association :user

    name                   {"abc"}
    explain                {"すごいで"}
    category_id            {"2"}
    sales_status_id        {"2"}
    shipping_fee_status_id {"2"}
    prefecture_id          {"2"}
    scheduled_delivery_id  {"2"}
    price                  {"5000"}

    after(:build) do |item|
      item.image.attach(io: File.open('spec/image/test_image.png'), filename: 'test_image.png')
    end
  end  
end
